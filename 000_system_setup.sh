source ./lib_sh/echos.sh
source ./lib_sh/requirers.sh

sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# git config
run "Setting up git env..."
git config --global user.email "8171598+kkvh@users.noreply.github.com"
git config --global user.name "kkvh"

# yay
run "Installing yay..."
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg --noconfirm -si
cd ..
rm -rf yay/

# Xserver (display server)
run "Installing Xserver..."
yay_nc xorg-server xorg-apps xorg-xinit
yay_nc xf86-video-intel
cp ./.xprofile $HOME

# i3 (window manager)
run "Installing i3..."
yay_nc i3-gaps i3lock i3status
yay_nc i3blocks
git clone https://github.com/vivien/i3blocks-contrib.git $HOME/.local/src/i3blocks-contrib
cp -r ./i3 $HOME/.config/
cp -r ./i3blocks $HOME/.config/
mkdir $HOME/Backgrounds
cp ./road_sunset.jpg $HOME/Backgrounds

# lightdm,lightdm-webkit2-greeter (display manager,greeter)
run "Installing lightdm..."
yay_nc lightdm
yay_nc lightdm-webkit2-greeter
yay_nc lightdm-webkit-theme-aether
sudo systemctl enable lightdm.service

# archey3
run "Installing archey3..."
yay_nc archey3

# rofi
run "Installing rofi..."
yay_nc rofi
cp -r ./rofi $HOME/.config/

# picom
yay_nc picom
cp ./picom.conf $HOME/.config/

# utils
run "Installing utils..."
yay_nc alacritty
yay_nc chromium curl
yay_nc deepin-screenshot
yay_nc feh file-roller firefox
yay_nc gcin
yay_nc lxappearance
yay_nc nemo net-tools numlockx
yay_nc openssh
yay_nc paper-icon-theme plank
yay_nc sysstat
yay_nc wget
yay_nc unclutter unrar zip unzip

# sound
yay_nc alsa-utils
yay_nc pulseaudio
# amixer sset Master unmute
# amixer sset Speaker unmute
# amixer sset Headphone unmute
# alsamixer
# speaker-test -c 2

# network
run "Installing NetworkManager..."
yay_nc networkmanager
yay_nc network-manager-applet
sudo systemctl enable NetworkManager.service

info "Installation complete. Please reboot."
