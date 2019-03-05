#!/usr/bin/env bash

set -e

GIT_STATUS="$(git status -s)"
GIT_SHORT_COMMIT="$(git rev-parse --short HEAD)"

REPO_NAME="carimus/node-alpine-aws"
NODE8_TAG="node8"
NODE10_TAG="node10"

if [[ -n "$GIT_STATUS" ]]; then
  echo "There are untracked changes or the working tree is dirty."
  echo "The image is tagged with the short git commit so please commit any changes before publishing."
  exit 1
fi

echo "Will build images with the following tags:"
echo -e "Based on node:10-alpine:\t$NODE10_TAG, latest, $GIT_SHORT_COMMIT, $GIT_SHORT_COMMIT-$NODE10_TAG"
echo -e "Based on node:8-alpine:\t$NODE8_TAG, $GIT_SHORT_COMMIT-$NODE8_TAG"
echo

echo "Based on node:10-alpine (default image):"

docker build -t $REPO_NAME:$NODE10_TAG \
  -t $REPO_NAME:latest \
  -t $REPO_NAME:$GIT_SHORT_COMMIT \
  -t $REPO_NAME:$GIT_SHORT_COMMIT-$NODE10_TAG \
  -f ./node10/Dockerfile \
  .

echo

echo "Based on node:8-alpine:"

docker build -t $REPO_NAME:$NODE8_TAG \
  -t $REPO_NAME:$GIT_SHORT_COMMIT-$NODE8_TAG \
  -f ./node8/Dockerfile \
  .

echo

echo "Pushing images to docker hub:"

docker push $REPO_NAME:$NODE10_TAG
docker push $REPO_NAME:latest
docker push $REPO_NAME:$GIT_SHORT_COMMIT
docker push $REPO_NAME:$GIT_SHORT_COMMIT-$NODE10_TAG
docker push $REPO_NAME:$NODE8_TAG
docker push $REPO_NAME:$GIT_SHORT_COMMIT-$NODE8_TAG

echo

echo "Done"
