source ./lib_sh/echos.sh
source ./lib_sh/requirers.sh

# git config
run "Setting up git env..."
git config --global user.email "8171598+kevinhui@users.noreply.github.com"
git config --global user.name "Kevin Hui"

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

# i3 (window manager)
run "Installing i3..."
yay_nc i3-wm i3lock i3status
yay_nc i3blocks

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

# utils
run "Installing utils..."
yay_nc chromium curl
yay_nc file-roller firefox
# yay_nc git gnome-terminal
yay_nc alacritty
echo "export TERMINAL=alacritty" >> $HOME/.profile
# yay_nc termite
yay_nc net-tools numlockx
yay_nc plank
yay_nc sysstat
yay_nc thunar
yay_nc wget
yay_nc unclutter unrar zip unzip

# sound
yay_nc alsa-utils
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
