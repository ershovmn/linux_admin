#!/bin/sh
rm -rf /home/test15
rm -rf /home/test14
rm -rf /home/test13
userdel -rf u2
groupdel g1
userdel -rf u1
rm -f /etc/skel/readme.txt 
rm work3.log
