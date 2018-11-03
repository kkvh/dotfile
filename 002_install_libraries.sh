source ./lib_sh/echos.sh
source ./lib_sh/requirers.sh

# ctags
run "Installing universal ctags..."
yay_nc universal-ctags-git

# docker
run "Installing docker..."
yay_nc docker
sudo usermod -a -G docker $USER
systemctl enable docker

# nodejs
run "Installing nodejs..."
yay_nc nvm
echo 'source /usr/share/nvm/init-nvm.sh' >> ~/.zshrc
source /usr/share/nvm/init-nvm.sh
nvm install node
yay_nc npm

# golang
run "Installing go..."
yay_nc go
mkdir ~/go && mkdir ~/go/src
echo 'export PATH=$PATH:~/go/bin' >> ~/.zshrc
