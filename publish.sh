#!/usr/bin/env bash

set -e

echo "Building image for node8:"

docker build -t carimus/node-alpine-aws:node8 \
  -f ./node8/Dockerfile \
  .

echo

echo "Building image for node10 (default image):"

docker build -t carimus/node-alpine-aws:node10 \
  -t carimus/node-alpine-aws:latest \
  -f ./node10/Dockerfile \
  .

echo

echo "Pushing images to docker hub:"

docker push carimus/node-alpine-aws:node8
docker push carimus/node-alpine-aws:node10
docker push carimus/node-alpine-aws:latest

echo

echo "Done"
