#!/bin/bash
sudo pacman -S --needed  base-devel
sudo pacman -S zsh firefox neovim rxvt-unicode python python-pip py3status rofi zathura ranger 
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si
cd 
pip install --user pynvim
yay -S autotiling ttf-nerd-fonts-hack-complete-git
cp -r ~/backup-configs/i3 ~/.config
cp ~/backup-configs/.Xresources ~
cp -r ~/backup-configs/nvim ~/.config 
reboot
