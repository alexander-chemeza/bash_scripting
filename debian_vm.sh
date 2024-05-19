#!/bin/bash
#
sudo apt install lsb-release

echo "deb http://deb.debian.org/debian $(lsb_release -cs)-backports main contrib" |
sudo tee /etc/apt/sources.list.d/backports.list

sudo apt install fasttrack-archive-keyring

echo "deb http://fasttrack.debian.net/debian-fasttrack/ $(lsb_release -cs)-fasttrack main contrib" |
sudo tee /etc/apt/sources.list.d/fasttrack.list
echo "deb http://fasttrack.debian.net/debian-fasttrack/ $(lsb_release -cs)-backports-staging main contrib" |
sudo tee -a /etc/apt/sources.list.d/fasttrack.list

sudo apt update

sudo apt install virtualbox virtualbox-ext-pack

 sudo apt install virtualbox-guest-x11
