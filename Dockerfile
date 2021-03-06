FROM ruby:2.6.6

RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev 
RUN set -x && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo 'deb http://dl.yarnpkg.com/debian/ stable main' > /etc/apt/sources.list.d/yarn.list
RUN set -x && apt-get update -qq && \
  apt-get install -yq build-essential nodejs yarn
WORKDIR /minwari-backend/
COPY ./Gemfile /minwari-backend/

RUN bundle install