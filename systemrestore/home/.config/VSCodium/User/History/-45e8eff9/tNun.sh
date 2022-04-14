#!/bin/bash
#set -e

function print_status() {
    tput setaf 4
    echo
    echo $1
    echo
    tput sgr0    
}

print_status ">> Installing Oh My ZSH"
#oh my zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

print_status ">> Installing Power level 10k"

# Configure zsh for powerlevel 10k
#touch "$HOME/.cache/zshhistory"
#-- Setup Alias in $HOME/zsh/aliasrc
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
#echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>! ~/.zshrc

sudo curl https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf -o /usr/share/fonts/TTF/MesloLGS%20NF%20Regular.ttf
sudo chmod 0444 MesloLGS%20NF%20Regular.ttf
sudo curl https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf -o /usr/share/fonts/TTF/MesloLGS%20NF%20Bold.ttf
sudo chmod 0444 MesloLGS%20NF%20Bold.ttf
sudo curl https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf -o /usr/share/fonts/TTF/MesloLGS%20NF%20Italic.ttf
sudo chmod 0444 MesloLGS%20NF%20Italic.ttf
sudo curl https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf -o /usr/share/fonts/TTF/MesloLGS%20NF%20Bold%20Italic.ttf
sudo chmod 0444 MesloLGS%20NF%20Bold%20Italic.ttf

fc-cache

exit