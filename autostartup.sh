#!/bin/bash

username="vcpb"
password="music"

echo "Adding user: $username with password:$password"

useradd -ms /bin/bash $username
usermod -aG audio $username
usermod -aG input $username
usermod -aG root $username
usermod -aG video $username
mkdir -p /run/user/$(id -u $username)/dbus-1/
chmod -R 700 /run/user/$(id -u $username)/
chown -R "$username" /run/user/$(id -u $username)/
chown -R $username:root /home/vcbot
chown -R $username:root /home
echo "$username:$password" | chpasswd
usermod -aG sudo $username

chmod +x /vnc-start.sh
chmod +x /home/xstartup
cd /shell-bot
node server