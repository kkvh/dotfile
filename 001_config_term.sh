GREEN='\033[0;32m'
GREEN_L='\033[1;32m'
NC='\033[0m'

# git config
echo -e "${GREEN}Setting up git env...${NC}"
git config --global user.email "8171598+kevinhui@users.noreply.github.com"
git config --global user.name "Kevin Hui"

# yay
echo -e "${GREEN}Installing yay...${NC}"
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
rm -rf yay/

# oh-my-zsh
echo -e "${GREEN}Installing zsh and oh-my-zsh...${NC}"
sudo pacman -S --noconfirm zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sed 's:env zsh -l::g')"

# fonts
echo -e "${GREEN}Installing powerline patched fonts...${NC}"
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh 
cd ..
rm -rf fonts
echo -e "${GREEN_L}Powerline patched fonts installed. You can now change your font in Preference.${NC}"
sleep 2

# powerlevel9k
echo -e "${GREEN}Installing zsh-theme-powerlevel9k...${NC}"
git clone https://github.com/bhilburn/powerlevel9k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel9k
sed -i '/^ZSH_THEME=/ s/".*"/"powerlevel9k/powerlevel9k"/' ~/.zshrc
# sudo pacman -S --noconfirm zsh-theme-powerlevel9k
# echo 'source /usr/share/zsh-theme-powerlevel9k/powerlevel9k.zsh-theme' >> ~/.zshrc

# tmux
echo -e "${GREEN}Installing tmux...${NC}"
sudo pacman -S --noconfirm tmux
echo 'export TERM="xterm-256color"' >> ~/.zshrc
echo 'set -g default-terminal "screen-256color"' >> ~/.tmux.conf
echo 'set-window-option -g mode-keys vi' >> ~/.tmux.conf

# fasd
yay -S fasd
sed -i '/^)$/i \ \ fasd' ~/.zshrc

# zsh plugins
sed -i '/^)$/i \ \ colored-man-pages' ~/.zshrc
sed -i '/^)$/i \ \ virtualenv' ~/.zshrc
echo 'POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(virtualenv)' >> ~/.zshrc
sed -i '/^)$/i \ \ docker' ~/.zshrc
sed -i '/^)$/i \ \ last-working-dir' ~/.zshrc
sed -i '/^)$/i \ \ vi-mode' ~/.zshrc

# zsh-autosuggestions
echo -e "${GREEN}Installing zsh-autosuggestions...${NC}"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
sed -i '/^)$/i \ \ zsh-autosuggestions' ~/.zshrc

# zsh-syntax-highlighting (must be last plugin!)
echo -e "${GREEN}Installing zsh-syntax-highlighting...${NC}"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
sed -i '/^)$/i \ \ zsh-syntax-highlighting' ~/.zshrc

# zsh alias
echo 'alias quit="exit"' >> ~/.zshrc
echo 'alias cls="clear"' >> ~/.zshrc
echo 'alias glogb="git bglog"' >> ~/.zshrc
