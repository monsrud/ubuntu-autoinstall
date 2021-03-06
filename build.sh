#!/bin/bash

if [ ! -d iso-source ]
then
    mkdir iso-source 
fi

if [ ! -f ubuntu-20.04.4-live-server-amd64.iso ]
then
    wget https://releases.ubuntu.com/20.04/ubuntu-20.04.4-live-server-amd64.iso
fi

7z -y x ubuntu-20.04.4-live-server-amd64.iso -oiso-source 

cp src/grub.cfg iso-source/boot/grub/
cp src/txt.cfg iso-source/isolinux/

if [ ! -d iso-source/cloud-init ]
then
    mkdir iso-source/cloud-init
fi

cp -rf cloud-init iso-source/
cp -rf ansible iso-source/
cp -rf  src/first_boot.sh iso-source/

rm -rf rm iso-source/\[BOOT\]/

cd iso-source

genisoimage -quiet -D -r -V "ubuntu-autoinstall" -cache-inodes -J -l -joliet-long -b isolinux/isolinux.bin -c isolinux/boot.cat -no-emul-boot -boot-load-size 4 -boot-info-table -eltorito-alt-boot -e boot/grub/efi.img -no-emul-boot -o  ../ubuntu-autoinstall.iso .

