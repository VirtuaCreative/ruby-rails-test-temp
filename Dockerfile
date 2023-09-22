FROM ruby:3.1.2-alpine AS builder
  RUN apk add build-base
  COPY Gemfile* ./
  RUN bundle install
  
FROM ruby:3.1.2-alpine AS runner
  RUN apk add nodejs

  WORKDIR /app
  # We copy over the entire gems directory for our builder image, containing the already built artifact
  COPY --from=builder /usr/local/bundle/ /usr/local/bundle/
  COPY . .
  EXPOSE 3000
  CMD ["rails", "server", "-b", "0.0.0.0"]
