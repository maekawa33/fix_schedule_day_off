FROM ruby:3.1.4
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash -
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs yarn libvips42
RUN mkdir /webapp
WORKDIR /webapp
ADD Gemfile /webapp/Gemfile
ADD Gemfile.lock /webapp/Gemfile.lock
RUN bundle install
ADD . /webapp