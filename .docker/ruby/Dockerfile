FROM ruby:2.6.2
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

WORKDIR /webapp

COPY ./api/Gemfile /webapp/Gemfile
COPY ./api/Gemfile.lock /webapp/Gemfile.lock

RUN gem update --system
RUN gem install bundler -v 2.0.1

RUN cd /webapp
RUN bundle install

ADD . /webapp
