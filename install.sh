#!/bin/sh

echo "bootstrapping aur"
sudo pacman -S git base-devel
cd /tmp
git clone https://aur.archlinux.org/yay.git
cd /tmp/yay
makepkg si

echo "installing packages"
yay -S - < packages.txt

echo "setting up doas"
echo "permit :wheel" | sudo tee /etc/doas.conf


echo "setting up dotfile repo"
cd ~
git init
git remote add origin https://github.com/humbertovnavarro/dotfiles.git
git pull origin main

echo "setting up rust"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

echo "setting up nvm/nodejs"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

echo "setting up ohmyzsh"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
