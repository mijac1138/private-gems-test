FROM ruby:2.6.1

RUN mkdir /app
WORKDIR /app

ADD . /app
RUN gem install bundler
RUN bundle install --jobs=8

CMD bundle exec rackup config.ru -p $PORT -E $RACK_ENV