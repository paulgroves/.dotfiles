#!/usr/bin/env bash

set -e

if [[ -d ~/.oh-my-zsh ]];
then
    $ZSH/tools/upgrade.sh
else
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    rm ~/.zshrc && mv ~/.zshrc.pre-oh-my-zsh ~/.zshrc
fi

if [[ ! -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions ]];
then
    git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
fi

if [[ ! -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting ]];
then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
fi

if [[ ! -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/agnoster-zsh-theme ]];
then
    git clone https://github.com/agnoster/agnoster-zsh-theme.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/agnoster-zsh-theme
fi