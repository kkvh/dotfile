source ./lib_sh/echos.sh
source ./lib_sh/requirers.sh

# oh-my-zsh
run "Installing zsh and oh-my-zsh..."
yay_nc zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sed 's:env zsh -l::g')"

# fonts
run "Installing powerline patched fonts..."
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh 
cd ..
rm -rf fonts
info "Powerline patched fonts installed. You can now change your font in Preference."
sleep 2

# powerlevel9k
run "Installing zsh-theme-powerlevel9k..."
git clone https://github.com/bhilburn/powerlevel9k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel9k
sed -i '/^ZSH_THEME=/ s/".*"/"powerlevel9k\/powerlevel9k"/' ~/.zshrc
# yay_nc zsh-theme-powerlevel9k
# echo 'source /usr/share/zsh-theme-powerlevel9k/powerlevel9k.zsh-theme' >> ~/.zshrc

# tmux
run "Installing tmux..."
yay_nc tmux
echo 'export TERM="xterm-256color"' >> ~/.zshrc
echo 'set -g default-terminal "screen-256color"' >> ~/.tmux.conf
echo 'set-window-option -g mode-keys vi' >> ~/.tmux.conf

# fasd
yay_nc fasd
sed -i '/^)$/i \ \ fasd' ~/.zshrc

# zsh plugins
echo 'POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir dir_writable vcs)' >> ~/.zshrc
echo 'POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(virtualenv status time)' >> ~/.zshrc
# echo 'POWERLEVEL9K_MODE="nerdfont-complete"' >> ~/.zshrc
# echo 'POWERLEVEL9K_MODE="awesome-patched"' >> ~/.zshrc
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
