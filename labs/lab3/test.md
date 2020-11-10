# Тестовое задание к 3 лабораторной работе
## Задание
Написать скрипт, котрый при созданни нового пользователя, добавляется в его домашний каталог.
При запуске скрипт должен задавать текущему пользователю новый пароль, который не совпадает с текущим
## Итог
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
