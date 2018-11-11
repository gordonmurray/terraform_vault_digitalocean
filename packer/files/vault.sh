#!/usr/bin/env bash

set -ex

# update and install unzip
sudo apt-get update
sudo apt-get install unzip -y

# install vault
wget https://releases.hashicorp.com/vault/0.11.4/vault_0.11.4_linux_amd64.zip
wget https://releases.hashicorp.com/vault/0.11.4/vault_0.11.4_SHA256SUMS
grep linux_amd64 vault_*_SHA256SUMS | sha256sum -c -
unzip vault_*.zip
sudo cp vault /usr/local/bin/
sudo setcap cap_ipc_lock=+ep /usr/local/bin/vault

# add a vault user
sudo useradd -r -d /var/lib/vault -s /bin/nologin vault
sudo install -o vault -g vault -m 750 -d /var/lib/vault

# change ownership
sudo chown vault:vault /etc/vault.hcl 
sudo chmod 640 /etc/vault.hcl 

# folders for letsencrypt to use later
sudo mkdir -p /etc/letsencrypt/archive
sudo mkdir -p /etc/letsencrypt/live

# create log file
touch /var/log/vault_audit.log
sudo chown vault:vault /var/log/vault_audit.log

sudo groupadd pki
sudo chgrp pki /etc/letsencrypt/{archive,live}
sudo chmod g+rx /etc/letsencrypt/{archive,live}
sudo gpasswd -a vault pki
sudo systemctl start vault
sudo systemctl status vault