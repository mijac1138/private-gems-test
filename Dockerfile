FROM ruby:2.6.1

RUN mkdir /app
WORKDIR /app

ADD . /app
COPY ./circleci_build .

CMD bundle exec rackup config.ru -p $PORT -E $RACK_ENV