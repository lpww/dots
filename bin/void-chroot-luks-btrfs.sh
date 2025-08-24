#!/bin/sh

# void-chroot-luks-btrfs
# use to chroot into a luks encrypted btrfs subvolume in void linux

set -e

cryptsetup open /dev/<the-encrypted-partition> crypt-drive
# <supply passphrase when prompted>
ls -l /dev/mapper/
echo you should see crypt-drive listed in the above output
mount -o subvol=@ /dev/mapper/crypt-drive /mnt
xchroot /mnt
echo you are not chrooted
ls -l
