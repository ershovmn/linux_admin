#!/bin/sh
mkdir ~/test #1
ls /etc -a -R -l > ~/test/list #2
#3
find /etc/* -type f -iname '.*' | wc -l >> ~/test/list
find /etc/* -maxdepth 0 -type d  | wc -l >> ~/test/list

mkdir ~/test/links #4
ln -P ~/test/list ~/test/links/list_hlink #5
ln -s ~/test/list ~/test/links/list_slink #6
#7
echo "count hard links 'list_hlink': $(stat -c %h ~/test/links/list_hlink)" 
echo "count hard links 'list': $(stat -c %h ~/test/list)"
echo "count hard links 'list_slink': $(stat -c %h ~/test/links/list_slink)"
cat ~/test/list | wc -l >> ~/test/links/list_hlink #8
#9
if cmp -s ~/test/list ~/test/links/list_hlink; then
  echo "9 - YES"
else
  echo "9 - NO"
fi
mv ~/test/list ~/test/list1 #10
#11
if cmp -s ~/test/links/list_slink ~/test/links/list_hlink; then
  echo "11 - YES"
else
  echo "11 - NO"
fi

ln -P ~/test/links/list_hlink ~/list1 #12
find /etc -type f -iname '*.conf' > ~/list_conf #13
find /etc -type d -iname '*.d' >  ~/list_d #14
cat ~/list_conf ~/list_d > list_conf_d #15
mkdir ~/test/.sub #16
cp ~/list_conf_d ~/test/.sub #17
cp --backup=t ~/list_conf_d ~/test/.sub #18
ls ~/test -alRA #19
man man > ~/man.txt #20
split ~/man.txt man_txt_ -b 1k #21
mkdir ~/man.dir #22
mv ~/man_txt_* ~/man.dir #23
cat ~/man.dir/* > ~/man.dir/man.txt #24
#25
if cmp -s ~/man.txt ~/man.dir/man.txt; then
  echo "25 - YES"
else
  echo "25 - NO"
fi
echo "hvsdywea\n$(cat ~/man.txt)\newyadfyuaw" > ~/man.txt #26
diff -u ~/man.dir/man.txt ~/man.txt > ~/man.diff #27
patch -R ~/man.txt ~/man.diff #29
#30
if cmp -s ~/man.txt ~/man.dir/man.txt; then
  echo "30 - YES"
else
  echo "30 - NO"
fi
