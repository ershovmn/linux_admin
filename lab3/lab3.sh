#!/bin/sh
cat /etc/passwd | awk -F: '{printf("user %s has id %s\n" ,$1, $3)}' > work3.log #1
passwd -S root | awk '{print $3}' >> work3.log #2
cat /etc/group | awk -F: '{print $1}' >> work3.log #3
echo "Be careful!" > /etc/skel/readme.txt #4
useradd u1 -p $(openssl passwd -crypt 12345678) #5
groupadd g1 #6
usermod -G g1 u1 #7
#8
cat /etc/passwd | grep "^u1:*" | awk -F: '{printf("user %s has id %s\n", $1, $3)}' >> work3.log
groups u1 | awk -F: '{print $2}' >> work3.log
usermod  -G g1 user #9
cat /etc/group | grep "^g1:*" | awk -F: '{print $4}' >> work3.log #10
usermod --shell /bin/mc u1 #11
useradd u2 -p $(openssl passwd -crypt 87654321) #12
#13
mkdir /home/test13
cp work3.log /home/test13/work3-1.log
cp work3.log /home/test13/work3-2.log
#14
chown u1:u2 -R /home/test13
chmod u=rw,g=rt,o= -R /home/test13
chmod ug+x /home/test13
#15
mkdir /home/test14
chown u1:g1 /home/test14 -R
chmod o+wrt,u-t /home/test14
#16
cp /usr/bin/nano /home/test14
chown u1 /home/test14/nano
chmod u+s /home/test14/nano
#17
mkdir test15
touch /home/test15/secret_file
echo "This is secret" > /home/test15/secret_file
chmod a=wx /home/test15/
