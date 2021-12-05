#!/bin/bash
sudo pacman -S --needed git base-devel
sudo pacman -S zsh
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si
cd 
pip install --user pynvim
yay -S autotiling ttf-nerd-fonts-hack-complete-git
cp -r ~/backup-configs/i3 ~/.config
cp ~/backup-configs/.Xresources ~
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

