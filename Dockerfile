FROM ruby:2.4
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /piggisapp
WORKDIR /piggisapp
COPY Gemfile /piggisapp/Gemfile
COPY Gemfile.lock /piggisapp/Gemfile.lock
RUN bundle install
COPY . /piggisapp
