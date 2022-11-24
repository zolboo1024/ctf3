#!/bin/bash

#create the users
adduser --gecos "" --disabled-password sshuser
adduser --gecos "" --disabled-password anotheruser
adduser --gecos "" --disabled-password anotheranotheruser

#set the passwords
#they need to crack the first one
echo "anotheranotheruser:christmas" | sudo chpasswd
echo "anotheruser:xmas" | sudo chpasswd
echo "sshuser:password1!" | sudo chpasswd

#just in case the user folders have not been created
mkdir /home/sshuser
mkdir /home/anotheruser
chmod 755 /home/anotheruser
chmod 755 /home/sshuser

#copy over <anotheruser> files
cp ./christmas_witch.sh ./current_time.txt ./etc_shadow ./every_minute.sh ./when_is_christmas.txt /home/anotheruser/
chown anotheruser:anotheruser /home/anotheruser/*
chmod 774 /home/anotheruser/christmas_witch.sh
chmod 666 /home/anotheruser/current_time.txt
chmod 640 /home/anotheruser/etc_shadow
chmod 750 /home/anotheruser/every_minute.sh
chmod 644 /home/anotheruser/when_is_christmas.txt

#copy over <sshuser> files
cp ./flag4.txt ./flag5.txt /home/sshuser/
chown anotheruser:anotheruser /home/sshuser/flag4.txt
chown anotheranotheruser:anotheranotheruser /home/sshuser/flag5.txt
chmod 400 /home/sshuser/flag4.txt
chmod 400 /home/sshuser/flag5.txt

#start the cron service
apt install cron
service cron start
crontab -u anotheruser ./newcron
#don't forget to delete the current directory when done
