#!/bin/bash
#set -e

#Variables
installed_dir=$HOME
now=$(date +"%m_%d_%Y")

function print_status() {
    echo
    echo $1
    echo
}

## Function to make a list of all installed packages

function installed_apps() {
pacs="$(pacman -Qq | sort -u)"
[ -n "$1" ] && list="$(cat "$@" | grep -oE '^[^(#|[:space:])]*' | sort -u)"
expl="$(comm -23 <(pacman -Qqe | sort -u) <(echo "$list"))"

echo "# Generated with makepkglist.sh"
echo "###############################"
echo
echo "# Groups:"
for g in $(pacman -Qqg | awk '{print $1}' | sort -u); do
    sqg="$(pacman -Sqg "$g" | sort -u)"
    count="$(echo "$sqg" | wc -l)"
    matches="$(comm -12 <(echo "$pacs") <(echo "$sqg") | wc -l)"
    if [ $count -eq $matches ] ; then
        pacs="$(comm -23 <(echo "$pacs") <(echo "$sqg"))"
        groups="$groups $g"
        echo "$list" | grep -q "$g" || printf "%-32s%s\n" "$g" "# Group: $g"
    fi
done

gpacs="$(pacman -Sgq $groups | sort -u)"

echo
echo "# Other packages:"
for p in $(comm -23 <(echo "$expl") <(echo "$gpacs")); do
    desc="$(pacman -Qi "$p" | grep Description | cut -d: -f2)"
    pacman -Qm "$p" >/dev/null 2>&1 && aur=" (AUR)" || aur=""
    printf "%-32s%s\n" "$p" "#$desc$aur"
done
}

echo
tput setaf 4
echo "################################################################################"
echo "################### Preparing to back up personal and system settings ##########"
echo "################################################################################"
tput sgr0

print_status ">>... Creating backup folders" 

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
[ -d $HOME"/systembackup/home/.config/VSCodium" ] || mkdir -p $HOME"/systembackup/home/.config/VSCodium"
[ -d $HOME"/systembackup/home/.vscode-oss" ] || mkdir -p $HOME"/systembackup/home/.vscode-oss"


print_status ">>... Backing up all Shell Dot Files"

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

print_status ">>... Backing Up konsole settings"

cp -arf $installed_dir/.local/share/konsole/* $installed_dir/systembackup/home/.local/share/konsole/

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

print_status ">>... Backing Up VSCodium Settings"

cp -arf $installed_dir/.vscode-oss/* $installed_dir/systembackup/home/.vscode-oss/
cp -arf $installed_dir/.config/VSCodium/* $installed_dir/systembackup/home/.config/VSCodium/

##### Here we call on sudo to copy over these system settings

print_status ">>... Backing Up setting to enable Mute Button LED"

sudo cp -arf /etc/modprobe.d/* $installed_dir/systembackup/etc/modprobe.d/

print_status ">>... Backing Up Snapper Config files"

sudo cp -arf /etc/snapper/configs/* $installed_dir/systembackup/etc/snapper/configs/

print_status ">>... Backing Up SDDM Resolution correction file"

sudo cp -arf /etc/X11/xorg.conf.d/* $installed_dir/systembackup/etc/X11/xorg.conf.d/
print_status

### Copy our restore scripts into backup folder 
sudo cp -arf /etc/skel/systemrestore/scripts/* $installed_dir/systembackup/scripts/
sudo install -D -m 755 /etc/skel/systemrestore/scripts/* $installed_dir/systembackup/scripts/

print_status ">>... Making a list of all installed applications"
### Make a copy of our installed apps
installed_apps > $installed_dir/systembackup/scripts/pkg/$now-packagelist.txt

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
