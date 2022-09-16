#!/bin/sh
# My custom install, blocks marked as optional can be omitted.
user=kamaii


echo "bootstrapping aur"
sudo pacman -S git base-devel
cd /tmp
git clone https://aur.archlinux.org/yay.git
cd /tmp/yay
makepkg -si
rm -rf /tmp/yay

echo "setting up dotfile repo"
cd ~
git init
git remote add origin https://github.com/humbertovnavarro/dotfiles.git
git pull origin main

cd ~/.rice

sudo systemctl enable bluetooth
sudo usermod -aG docker $user

#optional if you know what you're doing
echo "setting up automatic login, I hope you're using encryption :)"
sudo mkdir -p /etc/systemd/system/getty@tty1.service.d
cat autologin.conf | sudo tee /etc/systemd/system/getty@tty1.service.d/autologin.conf

#optional, sudo is included for backwards compatability, you can remove sudo if you want post install
echo "setting up doas"
echo "permit :wheel" | sudo tee /etc/doas.conf

echo "installing packages"
yay -S - < packages.txt

# everything beyond this point is optional 
echo "setting up rust"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

echo "setting up nvm/nodejs"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

echo "setting up ohmyzsh"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "setting up astro nvim"
git clone https://github.com/AstroNvim/AstroNvim ~/.config/nvim

