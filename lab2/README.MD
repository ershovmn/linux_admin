# Лабораторная работа 2
## 1
```shell
fdisk /dev/sda2
```
В интерактивном интерфейсе:
```shell
Command (m for help): n
Partition type
   p   primary (0 primary, 0 extended, 4 free)
   e   extended (container for logical partitions)
Select (default p): p
Partition number (1-4, default 1): 1
First sector (2048-12451839, default 2048): 2048
Last sector, +sectors or +size{K,M,G,T,P} (2048-12451839, default 12451839): +300M
```
