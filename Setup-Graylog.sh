# This is a VERY rough script to install graylog. Need to iron it out

# Install Java
sudo yum install java-1.8.0-openjdk-headless.x86_64 -y

# Setup Epel
sudo yum install epel-release -y
sudo yum install pwgen -y

# Install MongoDB
sudo mv mongodb-repo-file.txt /etc/yum.repos.d/mongodb-org-3.6.repo
sudo yum install mongodb-org -y
# sudo chkconfig --add mongod
sudo systemctl daemon-reload
sudo systemctl enable mongod.service
sudo systemctl start mongod.service

# Install Elasticsearch
mv elasticsearch-repo-file.txt /etc/yum.repos.d/elasticsearch.repo
sudo yum install elasticsearch-oss -y
# MODIFY /etc/elasticsearch/elasticsearch.yml TO SET CLUSTER NAME
sudo chkconfig --add elasticsearch
sudo systemctl daemon-reload
sudo systemctl enable elasticsearch.service
sudo systemctl restart elasticsearch.service

# Install Graylog
sudo rpm -Uvh https://packages.graylog2.org/repo/packages/graylog-3.0-repository_latest.rpm
sudo yum install graylog-server -y
# Generate a password
pwgen -N 1 -s 96
echo -n "changeme" && head -1 </dev/stdin | tr -d '\n' | sha256sum | cut -d" " -f1
#starting and enabling graylog
sudo chkconfig --add graylog-server
sudo systemctl daemon-reload
sudo systemctl enable graylog-server.service
sudo systemctl start graylog-server.service
