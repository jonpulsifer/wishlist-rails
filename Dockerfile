FROM ruby:2.5-alpine
RUN apk add --no-cache --update build-base linux-headers git nodejs mariadb-dev tzdata

WORKDIR /app
COPY Gemfile Gemfile.lock /app/
RUN bundle install --jobs 4

# Copy the application into the container
COPY . /app
EXPOSE 8080
