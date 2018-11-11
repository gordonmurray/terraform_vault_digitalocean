#!/usr/bin/env bash

set -ex

sudo apt update
sudo DEBIAN_FRONTEND=noninteractive apt-get -y -o Dpkg::Options::='--force-confdef' -o Dpkg::Options::='--force-confold' dist-upgrade
sudo apt dist-upgrade -y
sudo apt autoremove -y
sudo apt autoclean -y