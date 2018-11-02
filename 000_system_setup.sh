source ./lib_sh/echos.sh

# Xserver
run "Installing Xserver..."
sudo pacman -S --noconfirm --needed xorg-server xorg-apps xorg-xinit
sudo pacman -S --noconfirm --needed xf86-video-intel
xrandr --output VGA-1 --mode 1920x1080

# i3
run "Installing i3..."
sudo pacman -S --noconfirm i3-wm i3lock i3status
echo "exec i3" >> ~/.xinitrc
sudo pacman -S --noconfirm i3blocks

# lightdm
run "Installing lightdm..."
sudo pacman -S --noconfirm lightdm
# sudo pacman -S --noconfirm lightdm-webkit2-greeter

# archey3
run "Installing archey3..."
sudo pacman -S --noconfirm archey3

# rofi
run "Installing rofi..."
sudo pacman -S --noconfirm rofi

# utils
run "Installing utils..."
sudo pacman -S --noconfirm chromium conky curl
sudo pacman -S --noconfirm file-roller firefox
sudo pacman -S --noconfirm git gnome-terminal
sudo pacman -S --noconfirm net-tools numlockx
sudo pacman -S --noconfirm plank
sudo pacman -S --noconfirm sysstat
sudo pacman -S --noconfirm thunar
sudo pacman -S --noconfirm wget
sudo pacman -S --noconfirm unclutter unrar zip unzip

# sound

# network
run "Installing NetworkManager..."
sudo pacman -S networkmanager --noconfirm --needed
sudo pacman -S network-manager-applet --noconfirm --needed
sudo systemctl enable NetworkManager.service
sudo systemctl start NetworkManager.service
