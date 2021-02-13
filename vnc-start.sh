#!/bin/bash
if [ $UID -eq 0 ]; then
user=$1vcpb #Make change here if you changed username
exec su "$user" "$0" -- "$@"
fi
echo "Please, make a password for your vncserver"
echo "Your password should contain atleast 6 characters and maximum of 8"
read passwd
echo "your vncpassword is $passwd!"
user="vcpb"
mkdir /home/$user/.vnc
echo $passwd | vncpasswd -f > /home/$user/.vnc/passwd
chown -R $user:$user /home/$user/.vnc
chmod 0600 /home/$user/.vnc/passwd
vncserver
vncserver -kill :1
mv ~/.vnc/xstartup ~/.vnc/xstartup.bak
mv /home/xstartup ~/.vnc/xstartup

vncserver
