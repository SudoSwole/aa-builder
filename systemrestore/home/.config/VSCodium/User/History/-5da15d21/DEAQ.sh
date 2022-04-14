#!/bin/bash
#set -e

function print_status() {
    echo
    echo $1
    echo
}

echo
tput setaf 4
echo "################################################################################"
echo "################### Preparing to back up personal and system settings ##########"
echo "################################################################################"
tput sgr0
# echo
# echo ">>... Creating backup folders"
# echo
print_status ">>...... Creating backup folders" 
[ -d $HOME"/systembackup/" ] || mkdir -p $HOME"/systembackup/"
[ -d $HOME"/systembackup/home" ] || mkdir -p $HOME"/systembackup/home"
[ -d $HOME"/systembackup/home/.atom" ] || mkdir -p $HOME"/systembackup/home/.atom"
[ -d $HOME"/systembackup/home/.bin" ] || mkdir -p $HOME"/systembackup/home/.bin"
[ -d $HOME"/systembackup/home/github" ] || mkdir -p $HOME"/systembackup/home/github"
[ -d $HOME"/systembackup/home/.mozilla" ] || mkdir -p $HOME"/systembackup/home/.mozilla"
[ -d $HOME"/systembackup/home/.vim" ] || mkdir -p $HOME"/systembackup/home/.vim"
[ -d $HOME"/systembackup/home/powerlevel10k" ] || mkdir -p $HOME"/systembackup/home/powerlevel10k"
[ -d $HOME"/systembackup/home/.config/Atom" ] || mkdir -p $HOME"/systembackup/home/.config/Atom"
[ -d $HOME"/systembackup/home/.config/autostart" ] || mkdir -p $HOME"/systembackup/home/.config/autostart"
[ -d $HOME"/systembackup/home/.config/btop" ] || mkdir -p $HOME"/systembackup/home/.config/btop"
[ -d $HOME"/systembackup/home/.config/conky" ] || mkdir -p $HOME"/systembackup/home/.config/conky"
[ -d $HOME"/systembackup/home/.config/konsave" ] || mkdir -p $HOME"/systembackup/home/.config/konsave"
[ -d $HOME"/systembackup/home/.config/latte" ] || mkdir -p $HOME"/systembackup/home/.config/latte"
[ -d $HOME"/systembackup/home/.config/neofetch" ] || mkdir -p $HOME"/systembackup/home/.config/neofetch"
[ -d $HOME"/systembackup/home/.config/nvim" ] || mkdir -p $HOME"/systembackup/home/.config/nvim"
[ -d $HOME"/systembackup/home/.config/spicetify" ] || mkdir -p $HOME"/systembackup/home/.config/spicetify"
[ -d $HOME"/systembackup/home/.config/sublime-text" ] || mkdir -p $HOME"/systembackup/home/.config/sublime-text"
[ -d $HOME"/systembackup/home/.config/variety" ] || mkdir -p $HOME"/systembackup/home/.config/variety"
[ -d $HOME"/systembackup/home/.local/share/konsole" ] || mkdir -p $HOME"/systembackup/home/.local/share/konsole"
[ -d $HOME"/systembackup/home/Pictures" ] || mkdir -p $HOME"/systembackup/home/Pictures"
[ -d $HOME"/systembackup/etc/modprobe.d/" ] || mkdir -p $HOME"/systembackup/etc/modprobe.d/"
[ -d $HOME"/systembackup/etc/snapper/configs/" ] || mkdir -p $HOME"/systembackup/etc/snapper/configs/"
[ -d $HOME"/systembackup/etc/X11/xorg.conf.d/" ] || mkdir -p $HOME"/systembackup/etc/X11/xorg.conf.d/"
[ -d $HOME"/systembackup/scripts" ] || mkdir -p $HOME"/systembackup/scripts"

print_status ">>... Backing up all shell dot files"

installed_dir=$HOME
cp $installed_dir/.zshrc $installed_dir/systembackup/home/
cp $installed_dir/.zsh_history $installed_dir/systembackup/home/
cp $installed_dir/.bashrc $installed_dir/systembackup/home/
cp $installed_dir/.bash_history $installed_dir/systembackup/home/
cp $installed_dir/.config/nvim/* $installed_dir/systembackup/home/.config/nvim/
cp $installed_dir/.vimrc $installed_dir/systembackup/home/
cp $installed_dir/.p10k.zsh $installed_dir/systembackup/home/

print_status ">>... Backing Up autostart settings"

cp -arf  $installed_dir/.config/autostart/* $installed_dir/systembackup/home/.config/autostart/

print_status ">>... Backing Up Atom settings"

cp -arf $installed_dir/.atom/* $installed_dir/systembackup/home/.atom/
cp -arf $installed_dir/.config/Atom/* $installed_dir/systembackup/home/.config/Atom/

print_status ">>... Backing Up bin folder"

cp -arf $installed_dir/.bin/* $installed_dir/systembackup/home/.bin/

print_status ">>... Backing Up btop settings"

cp -arf $installed_dir/.config/btop/* $installed_dir/systembackup/home/.config/btop/

print_status ">>... Backing Up conky settings"

cp -arf $installed_dir/.config/conky/* $installed_dir/systembackup/home/.config/conky/

print_status ">>... Backing Up github folder"

cp -arf $installed_dir/github/* $installed_dir/systembackup/home/github/

print_status ">>... Backing Up konsave settings"

cp -arf $installed_dir/.config/konsave/* $installed_dir/systembackup/home/.config/konsave/

print_status ">>... Backing Up latte settings"

cp -arf $installed_dir/.config/latte/* $installed_dir/systembackup/home/.config/latte/

print_status ">>... Backing Up Mozilla settings"

cp -arf $installed_dir/.mozilla* $installed_dir/systembackup/home/.mozilla

print_status ">>... Backing Up neofetch settings"

cp -arf $installed_dir/.config/neofetch/* $installed_dir/systembackup/home/.config/neofetch/

print_status ">>... Backing Up nvim folder"

cp -arf $installed_dir/.config/nvim/* $installed_dir/systembackup/home/.config/nvim/

print_status ">>... Backing Up Pictures folder"

cp -arf $installed_dir/Pictures/* $installed_dir/systembackup/home/Pictures/

print_status ">>... Backing Up powerlevel10k settings"

cp -arf $installed_dir/powerlevel10k/* $installed_dir/systembackup/home/powerlevel10k/

print_status ">>... Backing Up spicetify settings"

cp -arf $installed_dir/.config/spicetify/* $installed_dir/systembackup/home/.config/spicetify/

print_status ">>... Backing Up sublime settings"

cp -arf $installed_dir/.config/sublime-text/* $installed_dir/systembackup/home/.config/sublime-text/

print_status ">>... Backing Up variety settings"

cp -arf $installed_dir/.config/variety/* $installed_dir/systembackup/home/.config/variety/

print_status ">>... Backing Up vim folder"

cp -arf $installed_dir/.vim/* $installed_dir/systembackup/home/.vim/

print_status ">>... Backing Up konsole settings"

cp -arf $installed_dir/.local/share/konsole/* $installed_dir/systembackup/home/.local/share/konsole/

##### Here we call on sudo to copy over these system settings

print_status ">>... Backing Up setting to enable Mute Button LED"

sudo cp -arf /etc/modprobe.d/* $installed_dir/systembackup/etc/modprobe.d/
echo
echo ">>... Backing Up Snapper Config files"
echo
sudo cp -arf /etc/snapper/configs/* $installed_dir/systembackup/etc/snapper/configs/
echo
echo ">>... Backing Up SDDM Resolution correction file"
echo
sudo cp -arf /etc/X11/xorg.conf.d/* $installed_dir/systembackup/etc/X11/xorg.conf.d/
echo
#install -C -D $HOME/systemrestore/scripts/* $HOME/systembackup/scripts/ 
sudo cp -arf /etc/skel/systemrestore/scripts/* $installed_dir/systembackup/scripts/
sudo chmod 755 -R $installed_dir/systembackup   
# echo "Adding personal thunar to .config/thunar"
# echo
# [ -d $HOME"/systembackup/home/.config/Thunar" ] || mkdir -p $HOME"/systembackup/home/.config/Thunar"
# cp  settings/thunar/uca.xml $HOME/.config/Thunar
# echo
# echo "Copy paste virtual box template"
# echo
# [ -d $HOME"/systembackup/home/VirtualBox VMs" ] || mkdir -p $HOME"/systembackup/home/VirtualBox VMs"
# sudo cp -rf settings/virtualbox-template/* $installed_dir/VirtualBox\ VMs/
# cd $installed_dir/VirtualBox\ VMs/
# tar -xzf template.tar.gz
# rm -f template.tar.gz

tput setaf 4
echo "################################################################################"
echo "################### Personal and system settings backed up #####################"
echo "################################################################################"
tput sgr0
echo
