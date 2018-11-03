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

# Xserver
run "Installing Xserver..."
yay_nc xorg-server xorg-apps xorg-xinit
yay_nc xf86-video-intel

# i3
run "Installing i3..."
yay_nc i3-wm i3lock i3status
echo "exec i3" >> ~/.xinitrc
yay_nc i3blocks

# lightdm
run "Installing lightdm..."
yay_nc lightdm
yay_nc lightdm-webkit2-greeter
yay_nc lightdm-webkit-theme-aether
systemctl enable lightdm.service

# archey3
run "Installing archey3..."
yay_nc archey3

# rofi
run "Installing rofi..."
yay_nc rofi

# utils
run "Installing utils..."
yay_nc chromium conky curl
yay_nc file-roller firefox
yay_nc git gnome-terminal
yay_nc net-tools numlockx
yay_nc plank
yay_nc sysstat
yay_nc thunar
yay_nc wget
yay_nc unclutter unrar zip unzip

# sound

# network
run "Installing NetworkManager..."
yay_nc networkmanager
yay_nc network-manager-applet
sudo systemctl enable NetworkManager.service

info "Installation complete. Please reboot."
