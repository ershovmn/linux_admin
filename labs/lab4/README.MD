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
yum deplist gcc > task4_1.log
```