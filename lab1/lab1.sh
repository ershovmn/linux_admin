#!/bin/sh
mkdir ~/test
ls /etc -a -R -l > ~/test/list
find /etc/* -type f -iname '.*' | wc -l >> ~/test/list
find /etc/* -maxdepth 0 -type d  | wc -l >> ~/test/list

mkdir ~/test/links
ln -P ~/test/list ~/test/links/list_hlink
ln -s ~/test/list ~/test/links/list_slink
echo "count hard links 'list_hlink': $(stat -c %h ~/test/links/list_hlink)"
echo "count hard links 'list': $(stat -c %h ~/test/list)"
echo "count hard links 'list_slink': $(stat -c %h ~/test/links/list_slink)"
cat ~/test/list | wc -l >> ~/test/links/list_hlink
if cmp -s ~/test/list ~/test/links/list_hlink; then
  echo "9 - YES"
else
  echo "9 - NO"
fi
mv ~/test/list ~/test/list1
if cmp -s ~/test/links/list_slink ~/test/links/list_hlink; then
  echo "11 - YES"
else
  echo "11 - NO"
fi

ln -P ~/test/links/list_hlink ~/list1
find /etc -type f -iname '*.conf' > ~/list_conf
find /etc -type d -iname '*.d' >  ~/list_d
cat ~/list_conf ~/list_d > list_conf_d
mkdir ~/test/.sub
cp ~/list_conf_d ~/test/.sub
cp --backup=t ~/list_conf_d ~/test/.sub
ls ~/test -alRA
man man > ~/man.txt
split ~/man.txt man_txt_ -b 1k
mkdir ~/man.dir
mv ~/man_txt_* ~/man.dir
cat ~/man.dir/* > ~/man.dir/man.txt
if cmp -s ~/man.txt ~/man.dir/man.txt; then
  echo "25 - YES"
else
  echo "25 - NO"
fi
echo "hvsdywea\n$(cat ~/man.txt)\newyadfyuaw" > ~/man.txt
diff -u ~/man.dir/man.txt ~/man.txt > ~/man.diff
patch -R ~/man.txt ~/man.diff
if cmp -s ~/man.txt ~/man.dir/man.txt; then
  echo "30 - YES"
else
  echo "30 - NO"
fi
