sudo su
apt-get update -y
apt-get install -y apache2
apt-get install -y gnupg
apt-get install -y wget
tar -xvf mysql-server_MVER-DVER_CPU.deb-bundle.tar
apt-get install -y libaio1
dpkg-preconfigure mysql-community-server_*.deb
dpkg -i mysql-{common,community-client-plugins,community-client-core,community-client,client,community-server-core,community-server,server}_*.deb
#sudo apt-get -f install

#systemctl status mysql.service
#
#rpm -i MySQL-client-advanced-5.5.8-1.rhel5.x86_64.rpm
#/etc/init.d/mysql start
