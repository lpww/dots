#!/bin/sh

# void-chroot-luks-btrfs
# use to chroot into a luks encrypted btrfs subvolume in void linux

set -e

sudo cryptsetup luksOpen /dev/sda2 encrypted_btrfs_partition
# <supply passphrase when prompted>
ls -l /dev/mapper/
echo you should see crypt-drive listed in the above output
sudo mount /dev/mapper/encrypted_btrfs_partition -o subvol=@ /mnt
echo chrooting...
sudo xchroot /mnt
ls -l
