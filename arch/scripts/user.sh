#!/bin/bash -l
set -e 
set TERM=xterm

source ~/install/util.sh
include ~/install/proxy.sh

echo '######################################################'
echo '########### INSTALLING STUFF ############'
echo '######################################################'
cd
sudo -E pacman -Sy --noconfirm i3-gaps i3status i3lock
sudo -E pacman -Sy --noconfirm virtualbox-guest-modules-arch virtualbox-guest-utils
sudo -E pacman -Sy --noconfirm xorg-server xorg-xinit xf86-video-fbdev xorg-xdpyinfo compton
sudo -E pacman -Sy --noconfirm ttf-font-awesome adobe-source-code-pro-fonts xorg-fonts-misc
sudo -E pacman -Sy --noconfirm zsh stow xterm rxvt-unicode git udiskie conky termite ranger htop nautilus arc-gtk-theme

# Preinstall trizen dependencies. makepkg can't handle proxy
sudo -E pacman -Sy --noconfirm perl-encode-locale perl-file-listing perl-html-parser perl-html-tagset perl-http-cookies perl-http-daemon perl-http-date perl-http-message perl-http-negotiate perl-io-html perl-io-socket-ssl perl-log-message perl-log-message-simple perl-lwp-mediatypes perl-net-http perl-net-ssleay perl-try-tiny perl-uri perl-www-robotrules pacutils perl-data-dump perl-json perl-libwww perl-lwp-protocol-https perl-term-readline-gnu perl-term-ui

cd /tmp
git clone https://aur.archlinux.org/trizen.git
cd trizen
makepkg -si
cd ..
rm -rf trizen

sudo -E chsh will -s $(which zsh)
sudo -E systemctl enable vboxservice.service

sudo usermod -a -G vboxsf will

echo '######################################################'
echo '########### CONFIG SETUP     ############'
echo '######################################################'
cd

head -n-5 /etc/X11/xinit/xinitrc > ~/.xinitrc
echo 'exec i3 -V >> ~/i3log-$(date +"%F-%k-%M-%S") 2>&1' >> ~/.xinitrc

rm -rf ~/.bashrc
cd shell && ./setup.sh

echo '########## DONE ##############'
