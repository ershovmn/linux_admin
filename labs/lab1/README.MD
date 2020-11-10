# Лабораторная работа №1
## 1
```shell
mkdir ~/test 
```
## 2
```shell
ls /etc -a -R -l > ~/test/list 
```
## 3
```shell
find /etc/* -type f -iname '.*' | wc -l >> ~/test/list
find /etc/* -maxdepth 0 -type d  | wc -l >> ~/test/list
```
## 4
```shell
mkdir ~/test/links 
```
## 5
```shell
ln -P ~/test/list ~/test/links/list_hlink 
```
## 6
```shell
ln -s ~/test/list ~/test/links/list_slink 
```
## 7
```shell
echo "count hard links 'list_hlink': $(stat -c %h ~/test/links/list_hlink)" 
echo "count hard links 'list': $(stat -c %h ~/test/list)"
echo "count hard links 'list_slink': $(stat -c %h ~/test/links/list_slink)"
```
## 8
```shell
cat ~/test/list | wc -l >> ~/test/links/list_hlink 
```
## 9
```shell
if cmp -s ~/test/list ~/test/links/list_hlink; then
  echo "9 - YES"
else
  echo "9 - NO"
fi
```
## 10
```shell
mv ~/test/list ~/test/list1 
```
## 11
```shell
if cmp -s ~/test/links/list_slink ~/test/links/list_hlink; then
  echo "11 - YES"
else
  echo "11 - NO"
fi
```
## 12
```shell
ln -P ~/test/links/list_hlink ~/list1 
```
## 13
```shell
find /etc -type f -iname '*.conf' > ~/list_conf 
```
## 14
```shell
find /etc -type d -iname '*.d' >  ~/list_d 
```
## 15
```shell
cat ~/list_conf ~/list_d > list_conf_d 
```
## 16
```shell
mkdir ~/test/.sub 
```
## 17
```shell
cp ~/list_conf_d ~/test/.sub 
```
## 18
```shell
cp --backup=t ~/list_conf_d ~/test/.sub 
```
## 19
```shell
ls ~/test -alRA 
```
## 20
```shell
man man > ~/man.txt 
```
## 21
```shell
split ~/man.txt man_txt_ -b 1k 
```
## 22
```shell
mkdir ~/man.dir 
```
## 23
```shell
mv ~/man_txt_* ~/man.dir 
```
## 24
```shell
cat ~/man.dir/* > ~/man.dir/man.txt 
```
## 25
```shell
if cmp -s ~/man.txt ~/man.dir/man.txt; then
  echo "25 - YES"
else
  echo "25 - NO"
fi
```
## 26
```shell
echo "hvsdywea\n$(cat ~/man.txt)\newyadfyuaw" > ~/man.txt 
```
## 27
```shell
diff -u ~/man.dir/man.txt ~/man.txt > ~/man.diff 
```
## 29
```shell
patch -R ~/man.txt ~/man.diff 
```
## 30
```shell
if cmp -s ~/man.txt ~/man.dir/man.txt; then
  echo "30 - YES"
else
  echo "30 - NO"
fi
```
## Тестовое задание
Написать скрипт, который, если есть папка test, то создает бэкап, если её нету, восстанавливает папку из последнего бэкапа  
[Скрипт](./test.sh)
```shell
if [ -d "test" ]; then
    mkdir -p backups
    FILENAME="backup_$(date '+%Y-%m-%d_%H-%M-%S').tar"
    tar -cf $FILENAME test 
    mv $FILENAME backups/$FILENAME
else
    if [ ! -d "backups" ]; then
        echo "No backups"
    else
        FILENAME="$(ls ~/test1/backups/ -t | head -n 1)"
        tar -xf backups/$FILENAME
    fi
fi
```
