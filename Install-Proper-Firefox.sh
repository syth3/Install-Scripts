#!/bin/bash

sudo snap remove --purge firefox
sudo add-apt-repository ppa:mozillateam/ppa
sudo apt install --target-release 'o=LP-PPA-mozillateam' firefox
echo "Package: firefox*" | sudo tee /etc/apt/preferences.d/mozillatemppa > /dev/null
echo "Pin: release o=LP-PPA-mozillateam" | sudo tee -a /etc/apt/preferences.d/mozillatemppa > /dev/null
echo "Pin-Priority: 501" | sudo tee -a /etc/apt/preferences.d/mozillatemppa > /dev/null
sudo apt update
