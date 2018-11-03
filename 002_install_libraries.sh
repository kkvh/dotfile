source ./lib_sh/echos.sh

# ctags
run "Installing universal ctags..."
yay -S universal-ctags-git

# docker
run "Installing docker..."
sudo pacman -S --noconfirm docker
sudo usermod -a -G docker $USER
systemctl enable docker

# nodejs
run "Installing nodejs..."
yay -S nvm
echo 'source /usr/share/nvm/init-nvm.sh' >> ~/.zshrc
source /usr/share/nvm/init-nvm.sh
nvm install node
sudo pacman -S --noconfirm npm

# golang
run "Installing go..."
sudo pacman -S --noconfirm go
mkdir ~/go && mkdir ~/go/src
echo 'export PATH=$PATH:~/go/bin' >> ~/.zshrc
