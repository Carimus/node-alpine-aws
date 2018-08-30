FROM node:10-alpine

# Install build packages we want
RUN apk add -Uuv git groff less python py-pip zip build-base bash gettext \
  && pip install awscli \
  && rm -rf /var/cache/apk/*
