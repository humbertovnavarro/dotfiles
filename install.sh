#!/bin/sh
sudo pacman -S \
sway \
waybar \
base-devel \
git \
cantarell-fonts \
ttf-font-awesome \
doas \
zsh \
rofi \
neovim \
mako \
git-lfs \
cd ~
git init
git remote add origin https://github.com/humbertovnavarro/dotfiles.git
git pull origin main
echo "permit :wheel" | sudo tee /etc/doas.conf


# rustup

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# nvm 

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

# ohmyzsh

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"