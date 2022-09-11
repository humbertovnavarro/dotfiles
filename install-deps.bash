#!/bin/bash
pacman -S \
sway \
waybar \
base-devel \
git \
adobe-source-code-pro-fonts \
doas \
zsh \
rofi \

echo "permit :wheel" >> /etc/doas.conf
