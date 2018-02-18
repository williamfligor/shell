#!/bin/bash -l
set -e 
set TERM=xterm

echo '######################################################'
echo '########### INSTALLING STUFF ############'
echo '######################################################'
cd
sudo pacman -Sy --noconfirm i3-gaps i3status i3lock
sudo pacman -Sy --noconfirm virtualbox-guest-modules-arch virtualbox-guest-utils
sudo pacman -Sy --noconfirm xorg-server xorg-xinit xf86-video-fbdev xorg-xdpyinfo compton
sudo pacman -Sy --noconfirm ttf-font-awesome adobe-source-code-pro-fonts xorg-fonts-misc
sudo pacman -Sy --noconfirm zsh stow xterm rxvt-unicode git udiskie conky termite ranger htop nautilus arc-gtk-theme

cd /tmp
git clone https://aur.archlinux.org/trizen.git
cd trizen
makepkg -si
cd ..
rm -rf trizen

sudo chsh will -s $(which zsh)
sudo systemctl enable vboxservice.service

echo '######################################################'
echo '########### CONFIG SETUP     ############'
echo '######################################################'
cd

head -n-5 /etc/X11/xinit/xinitrc > ~/.xinitrc
echo 'exec i3 -V >> ~/i3log-$(date +"%F-%k-%M-%S") 2>&1' >> ~/.xinitrc

rm -rf ~/.bashrc
cd shell && ./setup.sh

echo '########## DONE ##############'
