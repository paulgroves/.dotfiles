#!/usr/bin/env bash

set -e

NAME="Paul Groves"
EMAIL=$DOTFILE_EMAIL

git config --global user.name "${NAME}"
git config --global user.email $EMAIL

EXISTING_KEY=$(gpg --list-keys | grep $EMAIL | awk '{print $6}')

if [ ! -z "${EXISTING_KEY}" ]; then
    key_id=$(gpg --list-secret-keys --keyid-format=long --with-colons | head -1 | cut -d ':' -f5)
    git config --global user.signingkey $key_id
    echo "Key exists: $EXISTING_KEY"
else
    echo "pinentry-program /opt/homebrew/bin/pinentry-mac" >> ~/.gnupg/gpg-agent.conf 

    killall gpg-agent || true

    sudo cat >$HOME/.dotfiles/pgpkeygen <<EOF
        %echo Generating PGP key
        Key-Type: 1
        Key-Length: 4096
        Name-Real: $NAME
        Name-Comment: ''
        Name-Email: $EMAIL
        Expire-Date: 0
        %commit
        %echo done
EOF

    gpg --batch --full-generate-key pgpkeygen

    key_id=$(gpg --list-secret-keys --keyid-format=long --with-colons | head -1 | cut -d ':' -f5)

    git config --global user.signingkey $key_id

    gpg --armor --export $key_id > $HOME/.dotfiles/github_pgp_public_key
fi

