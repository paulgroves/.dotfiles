#!/usr/bin/env bash

set -e

echo "Installing global packages"
npm update -g \
  npm-check-updates \
  @vue/cli \
  typescript \
  serverless \
  yarn

ncu -g