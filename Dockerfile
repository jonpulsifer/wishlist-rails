FROM ruby:2.7.2-alpine
LABEL app.wishlist.docker.cmd="docker run -v `pwd`:/app -p 3000:3000 -d jonpulsifer/wishlist-rails"

# add a user early so it does not get clobbered
ARG APP_NAME=${APP_NAME:-wishlist}
ARG APP_GID=${APP_GID:-1337}
ARG APP_UID=${APP_UID:-1337}
ARG APP_HOME=${APP_HOME:-/app}
RUN addgroup -g ${APP_GID} ${APP_NAME} && \
    adduser -D \
    -h ${APP_HOME} \
    -s /bin/sh \
    -u ${APP_UID} \
    -G ${APP_NAME} \
    ${APP_NAME}

# runtime dependencies: yarn, nodejs, and bundler
SHELL ["/bin/ash", "-eo", "pipefail", "-c"]
# hadolint ignore=DL3018
RUN apk add --no-cache build-base yarn nodejs mysql-dev tzdata

# set the working directory and install gems
WORKDIR ${APP_HOME}
USER ${APP_UID}:${APP_GID}
COPY --chown=${APP_UID}:${APP_GID} Gemfile Gemfile.lock ${APP_HOME}/
RUN gem install bundler:2.1.4
RUN bundle config set without 'test development' && \
    bundle install --jobs 4

# copy in the application code after
COPY --chown=${APP_UID}:${APP_GID} . ${APP_HOME}
RUN yarn install --check-files

EXPOSE 3000
COPY docker-entrypoint.sh /docker-entrypoint.sh
COPY start-server.sh /start-server.sh
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["/start-server.sh"]
