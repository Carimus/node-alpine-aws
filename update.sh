#!/usr/bin/env bash

set -e

mkdir -p ./node8/
mkdir -p ./node10/
mkdir -p ./node12/
#mkdir -p ./node22/

sed s/__BASE_IMAGE__/node:8-alpine/ < ./Dockerfile.template > ./node8/Dockerfile
sed s/__BASE_IMAGE__/node:10-alpine/ < ./Dockerfile.template > ./node10/Dockerfile
sed s/__BASE_IMAGE__/node:12-alpine/ < ./Dockerfile.template > ./node12/Dockerfile
#sed s/__BASE_IMAGE__/node:22-alpine/ < ./Dockerfile.template > ./node22/Dockerfile
