source ./lib_sh/echos.sh
source ./lib_sh/requirers.sh

sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# ctags
run "Installing universal ctags..."
yay_nc universal-ctags-git

# cmake
run "Installing cmake..."
yay_nc cmake

# docker
run "Installing docker..."
yay_nc docker
sudo usermod -a -G docker $USER
sudo systemctl enable docker

# nodejs
run "Installing nodejs..."
yay_nc nvm
echo 'source /usr/share/nvm/init-nvm.sh' >> ~/.zshrc
source /usr/share/nvm/init-nvm.sh
nvm install node
yay_nc npm

# golang
# run "Installing go..."
# yay_nc go
# mkdir ~/go && mkdir ~/go/src
# echo 'export PATH=$PATH:~/go/bin' >> ~/.zshrc

# gvim
run "Installing gvim..."
yay_nc gvim
git clone https://github.com/kkvh/.vim.git -b dev ~/.vim
vim +PlugInstall +qall
