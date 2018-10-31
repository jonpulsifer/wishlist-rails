FROM ruby:2.5
RUN apt-get -qqy update && \
    apt-get -qqy upgrade && \
    apt-get -qqy install nodejs


WORKDIR /app
COPY Gemfile Gemfile.lock /app/
RUN bundle install --jobs 4

# Copy the application into the container
COPY . /app
RUN bundle exec rake assets:precompile
EXPOSE 8080
