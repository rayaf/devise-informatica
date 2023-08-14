FROM ruby:3.2.1-alpine

RUN apk add --update build-base \
    shared-mime-info \
    sqlite-dev \
    tzdata
RUN gem install rails -v '6.1.4'

WORKDIR /var/www/
ADD Gemfile Gemfile.lock /var/www/
RUN bundle install
