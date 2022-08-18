sudo su
apt-get update -y
apt-get install -y apache2
rpm -i MySQL-client-advanced-5.5.8-1.rhel5.x86_64.rpm
/etc/init.d/mysql start
