#!/bin/sh
mkdir /mnt/shares/1/
mkdir /mnt/shares/2/
mount -t fuse.vmhgfs-fuse .host:/1 /mnt/shares/1
mount -t fuse.vmhgfs-fuse .host:/2 /mnt/shares/2
cp -rc /mnt/shares/1/. /mnt/shares/2/
umount /mnt/shares/1
umount /mnt/shares/2
rm -rf /mnt/shares/1
rm -rf /mnt/shares/2
