# Лабораторная работа №3
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
usermod --shell /usr/bin/mc u1 
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
chown u1:g1 /home/test14 -R
chmod o+wrt,u-t /home/test14
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
chmod a=wx /home/test15/
```
## Тестовое задание
Написать скрипт, котрый при созданни нового пользователя, добавляется в его домашний каталог.
При запуске скрипт должен задавать текущему пользователю новый пароль, который не совпадает с текущим
[Скрипт](./test.sh)
```shell
type=$(cat /etc/shadow | grep $USER | awk -F: '{print $2}' | awk -F '\\$' '{print $2}')
salt=$(cat /etc/shadow | grep $USER | awk -F: '{print $2}' | awk -F '\\$' '{print $3}')
hash=$(cat /etc/shadow | grep $USER | awk -F: '{print $2}' | awk -F '\\$' '{print $4}')
passwd = $(openssl passwd -$type -salt $salt -crypt $(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 16))
while [1 = 1]
  if [ "$passwd" = "$hash" ]; then
    passwd = $(openssl passwd -$tpe -salt $salt -crypt $(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 16))
  else
    break
  fi
done
echo $passwd | passwd --stdin
```
