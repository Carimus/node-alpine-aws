#!/usr/bin/env bash

set -e

mkdir -p ./node8/
mkdir -p ./node10/

sed s/node:alpine/node:8-alpine/ < ./Dockerfile.template > ./node8/Dockerfile
sed s/node:alpine/node:10-alpine/ < ./Dockerfile.template > ./node10/Dockerfile
