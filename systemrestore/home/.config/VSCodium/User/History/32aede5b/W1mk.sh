#!/bin/bash
#set -e

###############################################################################################################################################################
# Before you run this script, know your LUKS Partition UUID and type it with no dashes in LUKSUUID variable. Same for your storage device name variable STORAGE
################################################################################################################################################################
###### Variables #######
KERNEL='linux-zen linux-lts intel-ucode'
## Open a terminal and type lsblk -f to get the correct information for the following variables
#Enter Crypto LUKS Partition name
CRYPTO_STORAGE='nvme0n1p2'
#Enter LUKS Partition UUID with no spaces
LUKSUUID='d36b433dfce44d91b7cef4f37c2a3bdd'

function print_status() {
    echo
    echo $1
    echo
}

function make_efi_folder() {
    sudo umount /boot
    sleep 1
    [ -d “/efi“ ] || sudo mkdir -p “/efi”
    sudo mount /efi 
}

function populate_boot() {
    sudo pacman -S --noconfirm --needed $KERNEL
}

function efi_backup() {
    sudo touch /etc/systemd/system/espbackup.path

echo -e '
[Unit]
Description=Monitors for changes in ESP
DefaultDependencies=no
After=efi.mount
BindsTo=efi.mount

[Path]
PathModified=/efi

[Install]
WantedBy=efi.mount' | sudo tee --append  /etc/systemd/system/espbackup.path

    sudo touch /etc/systemd/system/espbackup.service

echo -e '
[Unit]
Description=Sync ESP

[Service]
Type=oneshot
# Set the possible paths for `rsync`
Environment="PATH=/sbin:/bin:/usr/sbin:/usr/bin"
# Sync directories
ExecStart=rsync -a --delete /efi/ /.efi.backup' 

    sudo systemctl enable --now espbackup.path
}

function luks_backup() {
    sudo cryptsetup luksHeaderBackup /dev/$CRYPTO_STORAGE --header-backup-file /mnt/backup/file.img
}

function luks_convertkey() {
    sudo cryptsetup luksConvertKey --key-slot 0 --pbkdf pbkdf2 --iter-time 500 /dev/$CRYPTO_STORAGE
}

function gen_keyfile() {
    sudo dd bs=512 count=4 if=/dev/random of=/crypto_keyfile.bin iflag=fullblock
    sudo chmod 600 /crypto_keyfile.bin
    sudo chmod 600 /boot/initramfs-linux*
    sudo cryptsetup luksAddKey /dev/$STORAGE /crypto_keyfile.bin

    sudo sed -ie 's/FILES=(\(.*\))/FILES=(\1\/crypto_keyfile.bin)/' /etc/mkinitcpio.conf

    #sudo mkinitcpio -P
}

function grub_config() {
    sed -ie 's/GRUB_PRELOAD_MODULES="\(.*\)"/GRUB_PRELOAD_MODULES="\1 luks2"/' /etc/default/grub

    sudo touch /etc/grub.d/01_header
echo '
#! /bin/sh

# replace d36b433dfce44d91b7cef4f37c2a3bdd with UUID of your LUKS2 partition
echo "cryptomount -u $LUKSUUID"' | sudo tee -a /etc/grub.d/01_header

    sudo grub-install --target=x86_64-efi --efi-directory=/efi --boot-directory=/efi --bootloader-id=GRUB

    sleep 3
    sudo grub-mkconfig -o /efi/grub/grub.cfg
}

function grub_btrfs() {
    sudo pacman -Q grub-btrfs >/dev/null || sudo pacman -S --noconfirm --needed grub-btrfs 

    sleep 3
    #sed -ie 's/GRUB_BTRFS_GRUB_DIRNAME="/efi/grub"/GRUB_BTRFS_GRUB_DIRNAME ="/efi/grub"/' /etc/default/grub-btrfs/config
    sed -i 's/^GRUB_BTRFS_GRUB_DIRNAME="/efi/grub /' /etc/default/grub-btrfs/config

    sudo systemctl enable --now grub-btrfs.path

    sudo sed -ie 's/HOOKS=(\(.*\))/HOOKS=(\1 grub-btrfs-overlayfs)/' /etc/mkinitcpio.conf

    sudo mkinitcpio -P
}


###########################
# Now we run the script
###########################

if 	lsblk -f | grep btrfs > /dev/null 2>&1 ; then

    print_status ">> Changing efi folder from /boot to /efi"
    make_efi_folder

    print_status ">> Re-populating boot folder with image files"
    populate_boot

    print_status ">> Creating systemd units to automatically backup efi folder"
    efi_backup

    print_status ">> Backing Up your LUKS key to /mnt/backup/file.img"
    luks_backup

    print_status ">> Converting LUKS key to pbkdf2"
    luks_convertkey

    print_status ">> Generating Key File for Grub"
    gen_keyfile

    print_status ">> Updating Grub Configuration"
    grub_config
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    print_status ">> Updating Grub BTRFS Configuration"
    grub_btrfs

else

    print_status "#####> Your harddisk/ssd/nvme is not formatted as BTRFS <#####"
fi
# ## Example
# $ grep GRUB_CMDLINE_LINUX_DEFAULT /etc/default/grub

# GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"

# #sed
# sed -ie 's/GRUB_CMDLINE_LINUX_DEFAULT="\(.*\)"/GRUB_CMDLINE_LINUX_DEFAULT="\1 cgroup_enable=memory swapaccount=1"/' /etc/default/grub

# #result
# $ grep GRUB_CMDLINE_LINUX_DEFAULT /etc/default/grub

# GRUB_CMDLINE_LINUX_DEFAULT="quiet splash cgroup_enable=memory swapaccount=1"