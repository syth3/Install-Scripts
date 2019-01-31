# Install curl
sudo apt-get install curl -y

# Install SaltStack Minion Software
curl -L https://bootstrap.saltstack.com -o install-salt.sh

# Install SaltStack Master or Minion Software
read -p 'Install SaltStack master? (y/n): ' answer
read -p 'IP address of SaltStack master: ' ipaddress
if [ $answer = 'y' ]
then
    sudo sh install-salt.sh -M -A $ipaddress
else
    sudo sh install-salt.sh -A $ipaddress
fi
