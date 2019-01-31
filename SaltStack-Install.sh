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
    sudo sh install-salt.sh -M -A $ipaddress -i $minionId
else
    sudo sh install-salt.sh -A $ipAddress -i $minionId
fi
