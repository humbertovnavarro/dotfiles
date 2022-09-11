#!/bin/bash
pacman -S \
sway \
waybar \
base-devel \
git \
cantarell-fonts \
ttf-font-awesome \
doas \
zsh \
rofi \

echo "permit :wheel" >> /etc/doas.conf
