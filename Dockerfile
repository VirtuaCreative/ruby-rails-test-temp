  FROM ruby:3.1.2
  
  RUN apk add nodejs

  WORKDIR /app
  
  COPY Gemfile* ./
  
  RUN bundle install
  
  WORKDIR /app
  
  COPY . .
  EXPOSE 3000
 
  CMD ["rails", "server", "-b", "0.0.0.0"]
