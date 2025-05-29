FROM node:8-alpine

# Install build packages we want
RUN apk add -Uuv git less zip build-base bash gettext curl \
  && rm -rf /var/cache/apk/*

# Install awscli
RUN apk -v --update add \
        python3 \
        py-pip \
        groff \
        mailcap \
    && \
    pip install --upgrade awscli==1.14.5 s3cmd==2.0.1 python-magic && \
    apk -v --purge del py-pip && \
    rm /var/cache/apk/*

# Install sentry-cli
RUN curl -sL https://sentry.io/get-cli/ | bash

# Install wait-for-it
RUN curl https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh > /opt/wait-for-it.sh \
    && chmod +x /opt/wait-for-it.sh \
    && ln -s /opt/wait-for-it.sh /usr/bin/wait-for-it
