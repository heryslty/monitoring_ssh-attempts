#!/bin/bash

touch /tmp/login_X

nchksum=`md5sum /home/username/auth_X.log | awk -F " " '{print $1}'`
ochksum=`cat /tmp/login_X`

if [ "$nchksum" != "$ochksum" ]; then
echo "update"
A=`cat /home/username/auth_X.log | grep "Acc"| wc -l`
F=`cat /home/username/auth_X.log | grep "Connection closed by authenticating" | wc -l`
let C=$A+$F
date=`date`
echo "pada : $date terdapat percobaan login sebanyak $C" >> /home/username/log_ssh
echo "====>> Sukses login sebanyak $A" >> /home/username/log_ssh
echo "====>> Gagal login sebanyak $F" >> /home/username/log_ssh
else
 echo "no update"
fi
echo $C >/tmp/login_X
