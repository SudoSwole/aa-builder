#!/bin/bash
#set -e

#Variables
#installed_dir=$(dirname $(readlink -f $(basename `pwd`)))
installed_dir=$HOME

function print_status() {
    echo
    echo $1
    echo
}

echo
tput setaf 2
echo "################################################################################"
echo "################### Preparing to install personal and system settings ##########"
echo "################################################################################"
tput sgr0

print_status ">>_ Creating Neccessary Folders"

[ -d $HOME"/.atom" ] || mkdir -p $HOME"/.atom"
[ -d $HOME"/.bin" ] || mkdir -p $HOME"/.bin"
[ -d $HOME"/github" ] || mkdir -p $HOME"/github"
[ -d $HOME"/.mozilla" ] || mkdir -p $HOME"/.mozilla"
[ -d $HOME"/.vim" ] || mkdir -p $HOME"/.vim"
[ -d $HOME"/powerlevel10k" ] || mkdir -p $HOME"/powerlevel10k"
[ -d $HOME"/.config/Atom" ] || mkdir -p $HOME"/.config/Atom"
[ -d $HOME"/.config/autostart" ] || mkdir -p $HOME"/.config/autostart"
[ -d $HOME"/.config/btop" ] || mkdir -p $HOME"/.config/btop"
[ -d $HOME"/.config/conky" ] || mkdir -p $HOME"/.config/conky"
[ -d $HOME"/.config/konsave" ] || mkdir -p $HOME"/.config/konsave"
[ -d $HOME"/.config/latte" ] || mkdir -p $HOME"/.config/latte"
[ -d $HOME"/.config/neofetch" ] || mkdir -p $HOME"/.config/neofetch"
[ -d $HOME"/.config/nvim" ] || mkdir -p $HOME"/.config/nvim"
[ -d $HOME"/.config/spicetify" ] || mkdir -p $HOME"/.config/spicetify"
[ -d $HOME"/.config/sublime-text" ] || mkdir -p $HOME"/.config/sublime-text"
[ -d $HOME"/.config/variety" ] || mkdir -p $HOME"/.config/variety"
[ -d $HOME"/.local/share/konsole" ] || mkdir -p $HOME"/.local/share/konsole"
[ -d $HOME"/.config/VSCodium" ] || mkdir -p $HOME"/.config/VSCodium"
[ -d $HOME"/.vscode-oss" ] || mkdir -p $HOME"/.vscode-oss"

print_status ">>_ Installing all shell dot files"

cp $installed_dir/systemrestore/home/.zshrc ~
cp $installed_dir/systemrestore/home/.zsh_history ~
cp $installed_dir/systemrestore/home/.bashrc ~
cp $installed_dir/systemrestore/home/.bash_history ~
cp $installed_dir/systemrestore/home/.config/nvim/init.vim ~/.config/nvim
cp $installed_dir/systemrestore/home/.vimrc ~
cp $installed_dir/systemrestore/home/.p10k.zsh ~

print_status ">>_ Installing autostart settings"

cp -arf $installed_dir/systemrestore/home/.config/autostart/* ~/.config/autostart/

print_status ">>_ Installing Atom settings"

cp -arf $installed_dir/systemrestore/home/.atom/* ~/.atom/
cp -arf $installed_dir/systemrestore/home/.config/Atom/* ~/.config/Atom

print_status ">>_ Installing btop settings"

cp -arf $installed_dir/systemrestore/home/.config/btop/* ~/.config/btop

print_status ">>_ Installing conky settings"

cp -arf $installed_dir/systemrestore/home/.config/conky/* ~/.config/conky

print_status ">>_ Installing konsave settings"

cp -arf $installed_dir/systemrestore/home/.config/konsave/* ~/.config/konsave

print_status ">>_ Installing konsole settings"

cp -arf $installed_dir/systemrestore/home/.local/share/konsole/* ~/.local/share/konsole

print_status ">>_ Installing latte settings"

cp -arf $installed_dir/systemrestore/home/.config/latte/* ~/.config/latte

print_status ">>_ Installing neofetch settings"

cp -arf $installed_dir/systemrestore/home/.config/neofetch/* ~/.config/neofetch

print_status ">>_ Installing spicetify settings"

cp -arf $installed_dir/systemrestore/home/.config/spicetify/* ~/.config/spicetify

print_status ">>_ Installing sublime settings"

cp -arf $installed_dir/systemrestore/home/.config/sublime-text/* ~/.config/sublime-text

print_status ">>_ Installing variety settings"

cp $installed_dir/systemrestore/.config/variety/variety.conf ~/.config/variety

print_status ">>_ Installing VSCodium settings"

cp -arf $installed_dir/systemrestore/home/.vscode-oss/* ~/.vscode-oss/
cp -arf $installed_dir/systemrestore/home/.config/VSCodium/* ~/.config/VSCodium

##### Here we call on sudo to copy over these system settings
print_status ">>_ Copying setting to enable Mute Button LED"

sudo cp -arf $installed_dir/systemrestore/etc/modprobe.d/* /etc/modprobe.d

print_status ">>_ Copying Snapper Config files"

sudo cp -arf $installed_dir/systemrestore/etc/snapper/configs/* /etc/snapper/configs

print_status ">>_ Copying SDDM Resolution correction file"

sudo cp -arf $installed_dir/systemrestore/etc/X11/xorg.conf.d/* /etc/X11/xorg.conf.d
print_status
# echo "Adding personal thunar to .config/thunar"
# echo
# [ -d $HOME"/.config/Thunar" ] || mkdir -p $HOME"/.config/Thunar"
# cp  settings/thunar/uca.xml $HOME/.config/Thunar
# echo
# echo "Copy paste virtual box template"
# echo
# [ -d $HOME"/VirtualBox VMs" ] || mkdir -p $HOME"/VirtualBox VMs"
# sudo cp -rf settings/virtualbox-template/* ~/VirtualBox\ VMs/
# cd ~/VirtualBox\ VMs/
# tar -xzf template.tar.gz
# rm -f template.tar.gz
tput setaf 2
echo "#####################################################################################"
echo "################### Personal and system settings installed ##########################"
echo "#####################################################################################"
tput sgr0
echo
