#!/usr/bin/env bash

set -e

if ! command -v cargo &> /dev/null
then
  echo "Installing Rust..."
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | bash -s -- -y
  source $HOME/.cargo/env
  rustup component add rustfmt
fi

if ! command -v solana &> /dev/null
then
  echo "Installing Solana dev tools..."
  sh -c "$(curl -sSfL https://release.solana.com/stable/install)"
fi

if [[ $(anchor --version)='anchor-cli 0.2.1.0' ]]
then
  avm use 0.21.0
  echo "Using Anchor 0.21.0"
else
  echo "Installing Anchor 0.21.0..."
  cargo install --git https://github.com/project-serum/anchor avm --locked --force
  avm install 0.21.0
  avm use 0.21.0
fi

