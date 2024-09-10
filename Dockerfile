FROM ruby:3.3.1
RUN apt-get update -qq && apt-get install -y nodejs default-mysql-client libmariadb-dev
RUN mkdir /app
WORKDIR /app
COPY . /app
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install
