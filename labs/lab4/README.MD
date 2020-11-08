# Лабораторная работа №4
## 1
```shell
yum group install "Development Tools"
```
## 2
```shell
mkdir bastet && cd bastet
wget https://github.com/ershovmn/linux_admin/raw/master/labs/lab4/bastet-0.43.tgz
tar -xvf bastet-0.43.tgz
cd bastet-0.43
yum install boost-devel boost ncurses-devel ncurses
make
```
Изменяем ***Makefie***  
Добавляем раздел ***install***
```make
SOURCES=Ui.cpp main.cpp Block.cpp Well.cpp BlockPosition.cpp Config.cpp BlockChooser.cpp BastetBlockChooser.cpp
PROGNAME=bastet
LDFLAGS+=-lncurses
#CXXFLAGS+=-ggdb -Wall
CXXFLAGS+=-DNDEBUG -Wall
#CXXFLAGS+=-pg
#LDFLAGS+=-pg

all: $(PROGNAME)

depend: *.hpp $(SOURCES)
        $(CXX) -MM $(SOURCES) > depend

include depend

$(PROGNAME): $(SOURCES:.cpp=.o)
        $(CXX) -ggdb -o $(PROGNAME) $(SOURCES:.cpp=.o) $(LDFLAGS) -lboost_program_options

clean:
        rm -f $(SOURCES:.cpp=.o) $(PROGNAME)

mrproper: clean
        rm -f *~

install:
        cp bastet /usr/bin/
        chmod o+x /usr/bin/bastet
```
Выполняем установку
```shell
make install
```
## 3
```shell
yum list installed > task3.log
```
## 4
```shell
yum deplist gcc | grep "provider:" | awk '{print $2}' > task4_1.log
```
## 5
```shell
mkdir localrepo && cd localrepo
wget https://github.com/ershovmn/linux_admin/raw/master/labs/lab4/checkinstall-1.6.2-3.el6.1.x86_64.rpm
yum install createrepo
createrepo ~/localrepo/
```
Создаем файл ***/etc/yum.repos.d/localrepo.repo***
```
[localrepo]
name=localrepo
enabled=1
gpgcheck=0
baseurl=file:///root/localrepo/
```
```shell
yum update
```
## 6
```shell
yum repolist > task6.log
```
```shell
repo id                 repo name

AppStream               CentOS-8 - AppStream
BaseOS                  CentOS-8 - Base
extras                  CentOS-8 - Extras
localrepo               localrepo
```
## 7
```shell
 cd /etc/yum.repos.d/
 find -type f | sed 'p;s/$/.txt/' | xargs -n2 mv
 mv localrepo.repo.txt localrepo.repo
 yum update
 yum list available
 ```
 ```shell
 Last metadata expiration check: 0:11:37 ago on Sun 08 Nov 2020 05:42:22 PM MSK.
Available Packages
checkinstall.x86_64             1.6.2-3.el6.1           localrepo
```
```shell
yum install checkinstall
```
Возращаем всё
```shell
find -type f | sed 'p;s/.txt//' | xargs -n2 mv
yum update
```
## 8
```shell
wget https://github.com/ershovmn/linux_admin/raw/master/labs/lab4/fortunes-ru_1.52-2_all.deb
alien -r fortunes-ru_1.52-2_all.deb
sudo rpm -i --replacefiles fortunes-ru-1.52-3.noarch.rpm
```
## 9
```shell
wget https://www.nano-editor.org/dist/v5/nano-5.3.tar.gz

```