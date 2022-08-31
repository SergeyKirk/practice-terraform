#!/bin/bash
#sudo yum update -y
sudo yum install -y java-11-openjdk-devel
sudo yum install -y git
sudo yum install -y wget

sudo wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
sudo yum install -y jenkins
sudo systemctl start jenkins
sudo systemctl enable jenkins
sudo systemctl daemon-reload
