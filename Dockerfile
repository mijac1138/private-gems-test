FROM ruby:2.6.1

RUN mkdir /app
WORKDIR /app

ARG GIT_HUB_PRIVATE_GEMS_REPO
ENV GIT_HUB_PRIVATE_GEMS_REPO=$GIT_HUB_PRIVATE_GEMS_REPO

ARG TEST_TOKEN
ENV TEST_TOKEN=$TEST_TOKEN

ADD . /app

RUN gem install bundler
RUN bundle config $GIT_HUB_PRIVATE_GEMS_REPO $TEST_TOKEN
RUN bundle install --jobs=8

CMD bundle exec rackup config.ru -p $PORT -E $RACK_ENV