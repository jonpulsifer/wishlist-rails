FROM ruby:2.7.2
RUN apt-get -qqy update && \
    apt-get -qqy upgrade

# node 12
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get -qqy install nodejs


WORKDIR /app
COPY Gemfile Gemfile.lock /app/
RUN gem install bundler:1.17.3
RUN bundle install --jobs 4 --without development test

# Copy the application into the container
COPY . /app
RUN RAILS_ENV=production SECRET_KEY_BASE=assets bundle exec rake assets:precompile
EXPOSE 8080
