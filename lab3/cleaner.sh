#!/bin/sh
rm -Rf /home/test15
rm -Rf /home/test14
rm -Rf /home/test13
userdel -rf u2
groupdel g1
userdel -rf u1
rm -f /etc/skel/readme.txt 
rm work3.log
