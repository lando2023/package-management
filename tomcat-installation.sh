#!/bin/bash
# TOMCAT.SH
# Steps for installing tomcat9 on rhel7&8
# install Java JDK 1.8+ as a prerequisite for tomcat to run
# https://github.com/lando2023/package-management/tree/main
sudo hostnamectl set-hostname tomcat
cd /opt
sudo yum install git wget vim -y
sudo yum intsall java-1.8.0-openjdk-devel -y
# Download tomcat software and extract it
# download and extract tomcat software
sudo wget https://dlcdn.apache.org/tomcat/tomcat-10/v10.1.9/bin/apache-tomcat-10.1.9.tar.gz
sudo tar -xvf apache-tomcat-10.1.9.tar.gz
sudo rm apache-tomcat-10.1.9.tar.gz
sudo mv apache-tomcat-10.1.9.tar.gz tomcat10
sudo chmod 777 -R /opt/tomcat10
sudo sh /opt/tomcat10/bin/startup.sh
# Create a soft link to start and stop tomcat from anywhere
# to manage tomcat as a service
sudo ln -s /opt/tomcat10/bin/startup.sh /usr/bin/starttomcat
sudo starttomcat
echo “end on tomcat installation”
sudo su – ec2-user
#======================

#tomcat server configuration:
find / -name server.xml context.xml
vim /opt/tomcat10/conf/server.xml
vi /opt/tomcat10/webapps/manager/META-INF/context.xml
vi /opt/tomcat10/conf/tomcat-user.xml 
# to add user
<user username="lando2023" password="admin" roles="manager-gui,admin-gui">
