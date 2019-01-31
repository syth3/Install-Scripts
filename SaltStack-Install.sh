#!/bin/bash

: '
file: SaltStack-Install.sh
language: bash
author: Jacob Brown
description: download SaltStack master, minion, or both. If you download master, minion also gets installed (that's why it asks
  for a minion idea regardless).
Note: when downloading master, put 127.0.0.1 for IP Address prompt
'

# apt-get update
sudo apt-get update

# Install curl
sudo apt-get install curl -y

# Install SaltStack Minion Software
curl -L https://bootstrap.saltstack.com -o install-salt.sh

# Install SaltStack Master or Minion Software
read -p 'Install SaltStack master? (y/n): ' answer
read -p 'IP address of SaltStack master: ' ipAddress
read -p 'Minion ID: ' minionId
if [ $answer = 'y' ]
then
    sudo sh install-salt.sh -M -A $ipAddress -i $minionId
else
    sudo sh install-salt.sh -A $ipAddress -i $minionId
fi
