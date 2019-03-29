FROM ruby:2.6.1

RUN mkdir /app
WORKDIR /app

ADD . /app
RUN bundle install --jobs=8

CMD bundle exec rackup