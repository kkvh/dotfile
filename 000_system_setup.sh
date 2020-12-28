source ./lib_sh/echos.sh
source ./lib_sh/requirers.sh

sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# git config
run "Setting up git env..."
git config --global user.email "8171598+kkvh@users.noreply.github.com"
git config --global user.name "kkvh"

# utils
run "Installing utils..."
apt_nc chromium-browser curl

# gcin
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 835AB0E3
sudo cp /etc/apt/sources.list /etc/apt/sources.list.save
sudo sh -c 'echo "deb http://hyperrate.com/gcin-ubuntu2004 eliu release" >> /etc/apt/sources.list'
sudo sh -c 'echo "# deb-src http://hyperrate.com/gcin-ubuntu2004 eliu release" >> /etc/apt/sources.list'
apt_nc gcin
info "Please update gcin config."

info "Installation complete. Please reboot."
