#!/usr/bin/env bash

set -ex

sudo apt-get update
sudo apt-get install software-properties-common -y
sudo add-apt-repository ppa:certbot/certbot
sudo apt-get update
sudo apt-get install certbot -y