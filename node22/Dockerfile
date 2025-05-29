FROM node:22-alpine

# Install build packages we want
RUN apk add -Uuv \
    git \
    less \
    zip \
    build-base \
    bash \
    gettext \
    curl \
    aws-cli \ 
    s3cmd \
    groff \
    mailcap \
    docker-cli \
    && rm -rf /var/cache/apk/*

# Install sentry-cli
RUN curl -sL https://sentry.io/get-cli/ | bash

# Install wait-for-it
RUN curl https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh > /opt/wait-for-it.sh \
    && chmod +x /opt/wait-for-it.sh \
    && ln -s /opt/wait-for-it.sh /usr/bin/wait-for-it
