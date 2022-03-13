#!/usr/bin/env bash

set -e

SSH_KEY_FILE=$HOME/.ssh/id_ed25519

if [[ ! -f $SSH_KEY_FILE ]]; then
    ssh-keygen -t ed25519 -C "$DOTFILE_EMAIL" -f $SSH_KEY_FILE -q -N ""

    eval "$(ssh-agent -s)"

    ssh-add --apple-use-keychain ~/.ssh/id_ed25519
else
    echo "skipping as .ssh keyfile already exists"
fi