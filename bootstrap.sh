#!/usr/bin/env bash

# update
sudo yum -y update


# setup yum repo
sudo rpm -Uvh https://repo.mysql.com/mysql80-community-release-el7-3.noarch.rpm
sudo sed -i 's/enabled=1/enabled=0/' /etc/yum.repos.d/mysql-community.repo


# install mysql
sudo yum --enablerepo=mysql80-community install mysql-community-server -y

# restart mysql
sudo service mysqld restart

# get temp pass
sudo grep 'temporary password' /var/log/mysqld.log