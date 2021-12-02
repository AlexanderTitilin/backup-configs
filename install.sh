#!/bin/usr/bash
pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si
cd 
pip install --user pynvim
yay -S autotiling ttf-nerd-fonts-hack-complete-git
cp -r ~/backup-config/i3 ~/.backup-config
cp ~/backup-config/.Xresources ~
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

