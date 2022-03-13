#!/usr/bin/env bash

set -e

EXTENSIONS=(
	# "Ayushh.vscode-anchor" \
	# "bungcip.better-toml" \
	# "Compulim.vscode-clock" \
	# "eamodio.gitlens"
	# "enkia.tokyo-night" \
	# "GitHub.copilot"
	# "golang.go" \
	# "hashicorp.terraform" \
	# "ms-azuretools.vscode-docker" \
	# "ms-python.python" \
	# "ms-python.vscode-pylance" \
	# "ms-vscode-remote.remote-containers" \
	# "ms-vscode.vscode-typescript-next" \
	# "Prisma.prisma" \
	# "rebornix.ruby" \
	# "rust-lang.rust" \
	# "vadimcn.vscode-lldb"  
)

for EXTENSION in ${EXTENSIONS[@]}
do
	code --install-extension $EXTENSION --force
done

if [[ ! -L $HOME/Library/Application\ Support/Code/User/settings.json ]]; then
	ln -s ~/.dotfiles/vscode/settings.json $HOME/Library/Application\ Support/Code/User/settings.json
fi

