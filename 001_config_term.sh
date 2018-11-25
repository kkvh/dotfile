source ./lib_sh/echos.sh
source ./lib_sh/requirers.sh

# oh-my-zsh
run "Installing zsh and oh-my-zsh..."
yay_nc zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sed 's:env zsh -l::g')"

# fonts
# Powerline
# run "Installing powerline patched fonts..."
# git clone https://github.com/powerline/fonts.git --depth=1
# cd fonts
# ./install.sh 
# cd ..
# rm -rf fonts
# info "Powerline patched fonts installed. You can now change your font in Preference."
# nerd-fonts
run "Installing Meslo Nerd Font..."
# git clone https://github.com/ryanoasis/nerd-fonts.git && cd nerd-fonts
# ./install.sh Meslo
# cd ..
# rm -rf nerd-fonts
sudo mkdir /usr/share/fonts/NerdFonts
sudo cp "./Meslo LG M Regular Nerd Font Complete.otf" /usr/share/fonts/NerdFonts/
fc-cache -vf
run "Installing Source Sans Pro Fonts..."
yay_nc adobe-source-sans-pro-fonts
yay_nc adobe-source-sans-cn-fonts
yay_nc adobe-source-sans-tw-fonts

# powerlevel9k
run "Installing zsh-theme-powerlevel9k..."
git clone https://github.com/bhilburn/powerlevel9k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel9k
sed -i '/^ZSH_THEME=/ s/".*"/"powerlevel9k\/powerlevel9k"/' ~/.zshrc
# yay_nc zsh-theme-powerlevel9k
# echo 'source /usr/share/zsh-theme-powerlevel9k/powerlevel9k.zsh-theme' >> ~/.zshrc

# tmux
run "Installing tmux..."
yay_nc tmux
cp ./.tmux.conf ~

# fasd
yay_nc fasd
sed -i '/^)$/i \ \ fasd' ~/.zshrc

# zsh plugins
echo 'POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir dir_writable vcs)' >> ~/.zshrc
echo 'POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(virtualenv status time)' >> ~/.zshrc
sed -i '/^ZSH_THEME/i POWERLEVEL9K_MODE="nerdfont-complete"' ~/.zshrc
#sed -i '/^ZSH_THEME/i POWERLEVEL9K_MODE="awesome-patched"' ~/.zshrc
sed -i '/^)$/i \ \ colored-man-pages' ~/.zshrc
sed -i '/^)$/i \ \ virtualenv' ~/.zshrc
sed -i '/^)$/i \ \ docker' ~/.zshrc
sed -i '/^)$/i \ \ last-working-dir' ~/.zshrc
sed -i '/^)$/i \ \ vi-mode' ~/.zshrc

# zsh-autosuggestions
run "Installing zsh-autosuggestions..."
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
sed -i '/^)$/i \ \ zsh-autosuggestions' ~/.zshrc

# zsh-syntax-highlighting (must be last plugin!)
run "Installing zsh-syntax-highlighting..."
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
sed -i '/^)$/i \ \ zsh-syntax-highlighting' ~/.zshrc

# zsh alias
echo 'alias quit="exit"' >> ~/.zshrc
echo 'alias cls="clear"' >> ~/.zshrc
echo 'alias glogb="git bglog"' >> ~/.zshrc

# alacritty config
cp -rf ./alacritty ~/.config
