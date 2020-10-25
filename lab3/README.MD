# Лабораторная работа №3
!/bin/sh
## 1
```shell
cat /etc/passwd | awk -F: '{printf("user %s has id %s\n" ,$1, $3)}' > work3.log 
```
## 2
```shell
passwd -S root | awk '{print $3}' >> work3.log 
```
## 3
```shell
cat /etc/group | awk -F: '{print $1}' >> work3.log 
```
## 4
```shell
echo "Be careful!" > /etc/skel/readme.txt 
```
## 5
```shell
useradd u1 -p $(openssl passwd -crypt 12345678) 
```
## 6
```shell
groupadd g1 
```
## 7
```shell
usermod -G g1 u1 
```
## 8
```shell
cat /etc/passwd | grep "^u1:*" | awk -F: '{printf("user %s has id %s\n", $1, $3)}' >> work3.log
groups u1 | awk -F: '{print $2}' >> work3.log
```
## 9
```shell
usermod  -G g1 user 
```
## 10
```shell
cat /etc/group | grep "^g1:*" | awk -F: '{print $4}' >> work3.log 
```
## 11
```shell
usermod --shell /bin/mc u1 
```
## 12
```shell
useradd u2 -p $(openssl passwd -crypt 87654321) 
```
## 13
```shell
mkdir /home/test13
cp work3.log /home/test13/work3-1.log
cp work3.log /home/test13/work3-2.log
```
## 14
```shell
chown u1:u2 -R /home/test13
chmod u=rw,g=rt,o= -R /home/test13
chmod ug+x /home/test13
```
## 15
```shell
mkdir /home/test14
```
## 16
```shell
cp /usr/bin/nano /home/test14
chown u1 /home/test14/nano
chmod u+s /home/test14/nano
```
## 17
```shell
mkdir test15
touch /home/test15/secret_file
echo "This is secret" > /home/test15/secret_file
chmod a=wx /home/test15/#!/bin/sh
```
## 1
```shell
cat /etc/passwd | awk -F: '{printf("user %s has id %s\n" ,$1, $3)}' > work3.log 
```
## 2
```shell
passwd -S root | awk '{print $3}' >> work3.log 
```
## 3
```shell
cat /etc/group | awk -F: '{print $1}' >> work3.log 
```
## 4
```shell
echo "Be careful!" > /etc/skel/readme.txt 
```
## 5
```shell
useradd u1 -p $(openssl passwd -crypt 12345678) 
```
## 6
```shell
groupadd g1 
```
## 7
```shell
usermod -G g1 u1 
```
## 8
```shell
cat /etc/passwd | grep "^u1:*" | awk -F: '{printf("user %s has id %s\n", $1, $3)}' >> work3.log
groups u1 | awk -F: '{print $2}' >> work3.log
```
## 9
```shell
usermod  -G g1 user 
```
## 10
```shell
cat /etc/group | grep "^g1:*" | awk -F: '{print $4}' >> work3.log 
```
## 11
```shell
usermod --shell /bin/mc u1 
```
## 12
```shell
useradd u2 -p $(openssl passwd -crypt 87654321) 
```
## 13
```shell
mkdir /home/test13
cp work3.log /home/test13/work3-1.log
cp work3.log /home/test13/work3-2.log
```
## 14
```shell
chown u1:u2 -R /home/test13
chmod u=rw,g=rt,o= -R /home/test13
chmod ug+x /home/test13
```
## 15
```shell
mkdir /home/test14
```
task15
## 16
```shell
cp /usr/bin/nano /home/test14
chown u1 /home/test14/nano
chmod u+s /home/test14/nano
```
## 17
```shell
mkdir test15
touch /home/test15/secret_file
echo "This is secret" > /home/test15/secret_file
chmod a=wx /home/test15/
