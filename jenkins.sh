#!/bin/bash
#basic best practice installation
log=/opt/jlab/install.log
mkdir /opt/jlab/
touch $log
echo 'Updating Server' >> $log
sudo yum update -y
echo 'Done updating, Building repo' >> $log
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
echo 'Repo built, installing java open jdk11' >> $log
sudo amazon-linux-extras install java-openjdk11 -y
echo 'Done installing java, installing jenkins' >> $log
sudo yum install jenkins -y
echo 'Completed installation, setting up services.' >> $log
#Config
sudo systemctl enable jenkins.service
sudo systemctl start jenkins.service
sudo amazon-linux-extras install nginx1.12 -y
sudo systemctl enable nginx
sudo systemctl start nginx.service
echo 'Please navigate to server ip on port 8080, please ensure you have your firewall rules in place to support 8080 on the server ip.' >> $log
