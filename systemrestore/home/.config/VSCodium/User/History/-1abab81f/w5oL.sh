#!/bin/bash
#set -e

echo
tput setaf 2
echo "################################################################################"
echo "################### Preparing to install personal and system settings ##########"
echo "################################################################################"
tput sgr0
echo
echo "Creating neccessary folders"
echo
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
echo
echo ">>_ Installing all shell dot files"
echo
#installed_dir=$(dirname $(readlink -f $(basename `pwd`)))
installed_dir=$HOME
cp $installed_dir/systemrestore/home/.zshrc ~
cp $installed_dir/systemrestore/home/.zsh_history ~
cp $installed_dir/systemrestore/home/.bashrc ~
cp $installed_dir/systemrestore/home/.bash_history ~
cp $installed_dir/systemrestore/home/.config/nvim/init.vim ~/.config/nvim
cp $installed_dir/systemrestore/home/.vimrc ~
cp $installed_dir/systemrestore/home/.p10k.zsh ~
echo
echo ">>_ Installing autostart settings"
echo
cp -arf $installed_dir/systemrestore/home/.config/autostart/* ~/.config/autostart/
echo
echo ">>_ Installing Atom settings"
echo
cp -arf $installed_dir/systemrestore/home/.atom/* ~/.atom/
cp -arf $installed_dir/systemrestore/home/.config/Atom/* ~/.config/Atom
echo
echo ">>_ Installing btop settings"
echo
cp -arf $installed_dir/systemrestore/home/.config/btop/* ~/.config/btop
echo
echo ">>_ Installing conky settings"
echo
cp -arf $installed_dir/systemrestore/home/.config/conky/* ~/.config/conky
echo
echo ">>_ Installing konsave settings"
echo
cp -arf $installed_dir/systemrestore/home/.config/konsave/* ~/.config/konsave
echo
echo ">>_ Installing latte settings"
echo
cp -arf $installed_dir/systemrestore/home/.config/latte/* ~/.config/latte
echo
echo ">>_ Installing neofetch settings"
echo
cp -arf $installed_dir/systemrestore/home/.config/neofetch/* ~/.config/neofetch
echo
echo ">>_ Installing spicetify settings"
echo
cp -arf $installed_dir/systemrestore/home/.config/spicetify/* ~/.config/spicetify
echo
echo ">>_ Installing sublime settings"
echo
cp -arf $installed_dir/systemrestore/home/.config/sublime-text/* ~/.config/sublime-text
echo
echo ">>_ Installing variety settings"
echo
cp $installed_dir/systemrestore/.config/variety/variety.conf ~/.config/variety
echo
echo ">>_ Installing konsole settings"
echo
cp -arf $installed_dir/systemrestore/home/.local/share/konsole/* ~/.local/share/konsole
echo
##### Here we call on sudo to copy over these system settings
echo ">>_ Copying setting to enable Mute Button LED"
echo
sudo cp -arf $installed_dir/systemrestore/etc/modprobe.d/* /etc/modprobe.d
echo
echo ">>_ Copying Snapper Config files"
echo
sudo cp -arf $installed_dir/systemrestore/etc/snapper/configs/* /etc/snapper/configs
echo
echo ">>_ Copying SDDM Resolution correction file"
echo
sudo cp -arf $installed_dir/systemrestore/etc/X11/xorg.conf.d/* /etc/X11/xorg.conf.d
echo
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
