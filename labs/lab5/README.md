# Лабораторная работа 5
## Что не так
При загрузке операционной системы, получаем ошибку
![img1](https://github.com/ershovmn/linux_admin/raw/master/labs/lab5/photo_2020-12-18_12-07-00.jpg)
## Решение проблемы
### Шаг 1
Смторим файл ***/etc/fstab***  
Видим, что проблемный диск с неправильным UUID
![img2](https://github.com/ershovmn/linux_admin/raw/master/labs/lab5/img2.png)
### Шаг 2
Смотрим все UUID дисков  
![img3](https://github.com/ershovmn/linux_admin/raw/master/labs/lab5/img3.png)  
Понимаем, что у нас неправильный UUID, исправляем его
### Шаг 3
Перемонтируем диск для того, что бы была возможность перезаписи  
```shell
mount -o remount,rw /
```
Изменяем UUID
```shell
nano /etc/fstab
```
![img4](https://github.com/ershovmn/linux_admin/raw/master/labs/lab5/img4.png)
### Шаг 4
```shell
reboot
```

### Анализ ошибки
В /etc/fstab был введен неправильный uuid раздела, поэтому невозможно было примонтировать раздел при запуске. Исправлено изменением uuid

## ВСЁ УРА
© Ершов Михаил, Блашенков Алесандр, группа M33061
