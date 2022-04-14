#!/bin/bash

#konsave
export PATH=$PATH:~/.local/bin
cp -r $HOME/$SCRIPTHOME/configs/.config/* $HOME/.config/
pip install konsave
konsave -i $HOME/$SCRIPTHOME/configs/kde.knsv
sleep 1
konsave -a kde

#oh my zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Configure zsh for powerlevel 10k
touch "$HOME/.cache/zshhistory"
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

https://store.kde.org/p/1733294

https://github.com/L4ki/Desert-Plasma-Themes

https://linuxhint.com/copy-files-list-bash-script/

https://stackoverflow.com/questions/25246829/move-or-copy-files-from-a-list-in-linux#25317118

https://unix.stackexchange.com/questions/527101/copying-a-list-of-files

https://tecadmin.net/shell-script-to-copy-all-files-with-same-structure/

# Installing dotfiles from git repo
archer_dotfiles() {
    if [ ${#dotfilesrepo[@]} -gt 0 ] ; then
        printm 'Installing dotfiles from git repo'
        _s pacman --noconfirm --needed -S git
        for repo in "${dotfilesrepo[@]}" ; do
            tempdir="$(mktemp -d)" || err=true
            _s chown -R "$username:$username" "$tempdir"
            _s sudo -u "$username" git clone --depth 1 "$repo" "$tempdir/dotfiles"
            _s rm -rf "$tempdir/dotfiles/.git"
            _s sudo -u "$username" cp -rfT "$tempdir/dotfiles" "/home/$username"
        done
        showresult
    fi
}
