#!/bin/bash
#set -e

#  Script to Add Chaotic Repo
#  pacman-key --recv-key FBA220DFC880C036 --keyserver keyserver.ubuntu.com
#  pacman-key --lsign-key FBA220DFC880C036
#  pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
# Append (adding to the end of the file) to /etc/pacman.conf:
# [chaotic-aur]
# Include = /etc/pacman.d/chaotic-mirrorlist
# To run it, type  ./chaoticrepo.sh 

#HERE WE SET OUR REPO VARIABLES FOR THE SCRIPT

#Repo Key Variable
REPOKEY='FBA220DFC880C036'

#Key Server
KEYSERVER='keyserver.ubuntu.com'

#Mirrorlist
MIRRORLIST='https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'

#Check if the key is already installed
KEYCHECK=$(sudo pacman-key --list-keys)

#Add Repo to pacman conf file
APPEND='
[chaotic-aur]
Include = /etc/pacman.d/chaotic-mirrorlist'

function print_status() {
    tput setaf 4
    echo
    echo >>>... $1
    echo
    tput sgr0    
}

if grep -q "$REPOKEY" <<< "$KEYCHECK" ; then

    # tput setaf 4
    # echo
    # echo “The Repo Key Already Exists!! Exiting Script.”
    # echo
    # tput sgr0
    print_status The Repo Key Already Exists!! Exiting Script.”
else 
    tput setaf 4
    echo
    echo “Receiving the key $REPOKEY ....”
    echo
    tput sgr0

sudo pacman-key --recv-key $REPOKEY  --keyserver $KEYSERVER 

sleep 1
    tput setaf 4
    echo
    echo “Signing the key $REPOKEY ....”
    echo
    tput sgr0 
sudo pacman-key --lsign-key $REPOKEY 

sleep 1
    tput setaf 4
    echo
    echo “Downloading Mirrorlist $MIRRORLIST ....”
    echo
    tput sgr0 
sudo pacman -U $MIRRORLIST ;

sleep 5
    echo $APPEND | sudo tee --append /etc/pacman.conf

sleep 1
    tput setaf 4
    echo
    echo "Repo Successfully Added"
    echo
    tput sgr0

fi
