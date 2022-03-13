#!/usr/bin/env bash

set -e

cd ~/.dotfiles && find . -name install.sh -mindepth 2 | sort | while read installer; do sh -c $installer; done
