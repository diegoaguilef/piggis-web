FROM ruby:2.4-alpine3.9
RUN apk update && apk add --update nodejs-npm
RUN apk --update add --virtual build_deps \
    build-base ruby-dev libc-dev linux-headers \
    libressl-dev postgresql-dev libxml2-dev libxslt-dev \
    tzdata curl yarn git 
RUN mkdir /usr/src/app/
WORKDIR /usr/src/app/
ADD Gemfile /usr/src/app/Gemfile
ADD Gemfile.lock /usr/src/app/Gemfile.lock
ADD package.json /usr/src/app/package.json
ADD yarn.lock /usr/src/app/yarn.lock
RUN RAILS_ENV=production bundle install
ADD . /usr/src/app/
RUN yarn install
EXPOSE 3000

