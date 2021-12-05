#!/bin/bash
sudo pacman -S --needed  base-devel
sudo pacman -S zsh firefox neovim rxvt-unicode python python-pip py3status rofi
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si
cd 
pip install --user pynvim
yay -S autotiling ttf-nerd-fonts-hack-complete-git
cp -r ~/backup-configs/i3 ~/.config
cp ~/backup-configs/.Xresources ~
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
cp -r ~/backup-configs/nvim ~/.config 
reboot
