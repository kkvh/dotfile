GREEN='\033[0;32m'
GREEN_L='\033[1;32m'
NC='\033[0m'

# ctags
echo -e "${GREEN}Installing universal ctags...${NC}"
yay -S universal-ctags-git

# docker
echo -e "${GREEN}Installing docker...${NC}"
sudo pacman -S --noconfirm docker
sudo usermod -a -G docker $USER
systemctl enable docker

# nodejs
echo -e "${GREEN}Installing nodejs...${NC}"
yay -S nvm
echo 'source /usr/share/nvm/init-nvm.sh' >> ~/.zshrc
source /usr/share/nvm/init-nvm.sh
nvm install node
sudo pacman -S --noconfirm npm

# golang
echo -e "${GREEN}Installing go...${NC}"
sudo pacman -S --noconfirm go
mkdir ~/go && mkdir ~/go/src
echo 'export PATH=$PATH:~/go/bin' >> ~/.zshrc
