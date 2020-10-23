# Лабораторная работа 2
## 1
```shell
fdisk /dev/sda
```
В интерактивном интерфейсе:
```shell
Command (m for help): n
Partition type
   p   primary (2 primary, 0 extended, 2 free)
   e   extended (container for logical partitions)
Select (default p): p
Partition number (3,4, default 3): 3
First sector (14551040-16777215, default 14551040):
Last sector, +sectors or +size{K,M,G,T,P} (14551040-16777215, default 16777215): +300M

Created a new partition 3 of type 'Linux' and of size 300 MiB.

Command (m for help): w
The partition table has been altered.
Syncing disks.
```
## 2
```shell
sudo blkid | grep "^/dev/sda3:" | awk -F\" '{ print $2 }' | sudo dd of=/root/NewPartUUID
```
## 3
```shell
DISKNAME=$(sudo blkid | grep $(sudo cat /root/NewPartUUID) | awk -F: '{ print $1 }')
mkfs -t ext4 -b 4096 $DISKNAME
```
## 4
```shell
dumpe2fs -h $DISKNAME
```
<details>
<summary>Вывод</summary>
   
```shell
Filesystem volume name:   <none>
Last mounted on:          <not available>
Filesystem UUID:          3c547d94-8899-4aa1-a15f-151689650467
Filesystem magic number:  0xEF53
Filesystem revision #:    1 (dynamic)
Filesystem features:      has_journal ext_attr resize_inode dir_index filetype extent 64bit flex_bg sparse_super large_file huge_file dir_nlink extra_isize metadata_csum
Filesystem flags:         signed_directory_hash
Default mount options:    user_xattr acl
Filesystem state:         clean
Errors behavior:          Continue
Filesystem OS type:       Linux
Inode count:              76800
Block count:              76800
Reserved block count:     3840
Free blocks:              70214
Free inodes:              76789
First block:              0
Block size:               4096
Fragment size:            4096
Group descriptor size:    64
Reserved GDT blocks:      37
Blocks per group:         32768
Fragments per group:      32768
Inodes per group:         25600
Inode blocks per group:   800
Flex block group size:    16
Filesystem created:       Fri Oct 23 01:26:22 2020
Last mount time:          n/a
Last write time:          Fri Oct 23 01:26:22 2020
Mount count:              0
Maximum mount count:      -1
Last checked:             Fri Oct 23 01:26:22 2020
Check interval:           0 (<none>)
Lifetime writes:          173 kB
Reserved blocks uid:      0 (user root)
Reserved blocks gid:      0 (group root)
First inode:              11
Inode size:               128
Journal inode:            8
Default directory hash:   half_md4
Directory Hash Seed:      316f89da-34d7-4f1c-97f1-fd69a2624a38
Journal backup:           inode blocks
Checksum type:            crc32c
Checksum:                 0x9ff920e0
Journal features:         (none)
Journal size:             16M
Journal length:           4096
Journal sequence:         0x00000001
Journal start:            0
```
</details>

## 5

```shell
tune2fs -i 2m -c 2 $DISKNAME
```
## 6
```shell
mkdir /mnt/newdisk/
mount $DISKNAME /mnt/newdisk
```
## 7
```shell
ln -s /mnt/newdisk ~/nd
```
## 8
```shell
mkdir /mnt/newdisk/abc
```
## 9
Вставляем новую строку в файл ***/etc/fstab***
```shell
$DISKNAME /mnt/newdisk ext4 noexec,noatime  0 0
```
## 10
```shell
umount $DISKNAME && fdisk /dev/sda
```
В интерактивном интерфейсе:
```shell
Command (m for help): d
Partition number (1-3, default 3): 3

Partition 3 has been deleted.

Command (m for help): n
Partition type
   p   primary (2 primary, 0 extended, 2 free)
   e   extended (container for logical partitions)
Select (default p):

Using default response p.
Partition number (3,4, default 3):
First sector (14551040-16777215, default 14551040):
Last sector, +sectors or +size{K,M,G,T,P} (14551040-16777215, default 16777215): +350M

Created a new partition 3 of type 'Linux' and of size 350 MiB.
Partition #3 contains a ext4 signature.

Do you want to remove the signature? [Y]es/[N]o: N

Command (m for help): w

The partition table has been altered.
Syncing disks.
```
Далее
```shell
e2fsck -f /dev/sda3
resize2fs $DISKNAME
```
## 11
```shell
df -h 
```
## 12
```shell
fdisk /dev/sda
```
В интерактивном интерфейсе:
```shell
Command (m for help): n
Partition type
   p   primary (3 primary, 0 extended, 1 free)
   e   extended (container for logical partitions)
Select (default e): p

Selected partition 4
First sector (15267840-16777215, default 15267840):
Last sector, +sectors or +size{K,M,G,T,P} (15267840-16777215, default 16777215): +12M

Created a new partition 4 of type 'Linux' and of size 12 MiB.

Command (m for help): w
The partition table has been altered.
Syncing disks.
```
Далее
```shell
mke2fs -O journal_dev -b 4096 /dev/sda4
tune2fs -j -J device=/dev/sdb4 $DISKNAME
```
## 13
```shell
fdisk /dev/sdb
```
В интерактивном интерфейсе:
```shell
Command (m for help): n
Partition type
   p   primary (0 primary, 0 extended, 4 free)
   e   extended (container for logical partitions)
Select (default p): p
Partition number (1-4, default 1):
First sector (2048-8388607, default 2048):
Last sector, +sectors or +size{K,M,G,T,P} (2048-8388607, default 8388607): +100M

Created a new partition 1 of type 'Linux' and of size 100 MiB.

Command (m for help): n
Partition type
   p   primary (1 primary, 0 extended, 3 free)
   e   extended (container for logical partitions)
Select (default p): p
Partition number (2-4, default 2):
First sector (206848-8388607, default 206848):
Last sector, +sectors or +size{K,M,G,T,P} (206848-8388607, default 8388607): +100M

Created a new partition 2 of type 'Linux' and of size 100 MiB.

Command (m for help): w
The partition table has been altered.
Calling ioctl() to re-read partition table.
Syncing disks.
```
## 14
```shell
lvmdiskscan
pvcreate /dev/sdb1 /dev/sdb2
vgcreate volumeGr /dev/sdb1 /dev/sdb2
lvcreate -L 192M -n lv volumeGr
lvscan
mkfs -t ext4 /dev/volumeGr/lv
mkdir /mnt/supernewdisk && mount /dev/volumeGr/lv /mnt/supernewdisk
```
## 15
```shell
mkdir /mnt/share
sudo mount -t fuse.vmhgfs-fuse .host:/share /mnt/share
```
## 16
Вставляем новую строку в файл ***/etc/fstab***
```shell
.host:/share /mnt/share fuse.vmhgfs-fuse defaults 0 0
```
