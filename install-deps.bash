#!/bin/bash
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
cd ~
git init
git remote add origin https://github.com/humbertovnavarro/dotfiles.git
git pull origin main
echo "permit :wheel" | sudo tee /etc/doas.conf
