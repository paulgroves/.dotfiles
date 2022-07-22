#!/usr/bin/env bash

set -e

EXTENSIONS=(
	"Ayushh.vscode-anchor"
	"bradlc.vscode-tailwindcss"
	"bungcip.better-toml"
	"Compulim.vscode-clock"
	"dbaeumer.vscode-eslint"
	"eamodio.gitlens"
	"enkia.tokyo-night"
	"esbenp.prettier-vscode"
	"foxundermoon.shell-format"
	"GitHub.copilot"
	"golang.go"
	"hashicorp.terraform"
	"ms-azuretools.vscode-docker"
	"ms-python.python"
	"ms-python.vscode-pylance"
	"ms-vscode-remote.remote-containers"
	"ms-vscode.vscode-typescript-next"
	"MS-vsliveshare.vsliveshare-pack"
	"Prisma.prisma"
	"rebornix.ruby"
	"rust-lang.rust-analyzer"
	"vadimcn.vscode-lldb"
)

for EXTENSION in ${EXTENSIONS[@]}; do
	code --install-extension $EXTENSION --force
done

if [[ ! -L $HOME/Library/Application\ Support/Code/User/settings.json ]]; then
	ln -s ~/.dotfiles/vscode/settings.json $HOME/Library/Application\ Support/Code/User/settings.json
fi
