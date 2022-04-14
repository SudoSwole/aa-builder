#!/bin/bash
#set -e

#Set Repo Key Variable
REPOKEY='FBA220DFC880C036'

#Set Key Server
KEYSERVER='keyserver.ubuntu.com'

#Set Mirrorlist
#MIRRORLIST='https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'

#Check if the key is already installed
#KEYCHECK=$(pacman-key -l | grep "$REPOKEY")
KEYCHECK=$(sudo pacman-key --list-keys)

#if [ "$KEYCHECK" = "$REPOKEY" ] ; then
if grep -q "$REPOKEY" <<< "$KEYCHECK" ; then

    echo “The Repo Key Already Exists!! Exiting Script.”
fi


# BECHE=1

# if [ $BECHE -eq 1 ] ; then 
# echo "The Variable is 1"
# fi



# STRING="Friday"
# if [ "$STRING" = "Friday" ] ; then
# echo "It's Friday Muddasucka!"
# else
# echo "Keep slaving Muddasucka!"
# fi


# STRING="FRIDAY"
# if [ "$STRING" != "Monday" ] ; then
#     echo "At least it's not Monday"
#     fi

# filename="$HOME"
# if [ -f "$filename" ] ; then
#     echo "$filename is a regular file"
# elif [ -d "$filename" ] ; then 
#     echo "$filename is a directory"
# else
#     echo "I have no idea what $filename is"
# fi    
