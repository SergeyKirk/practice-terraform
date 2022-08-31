sudo su
sudo mkdir /var/lib/jenkins
#ls -l /var/lib | grep jenkins
sudo useradd -d /var/lib/jenkins jenkins
sudo chown jenkins:jenkins /var/lib/jenkins
#ls -l /var/lib | grep jenkins
ssh-keygen -f /root/.ssh/id_rsa -t rsa -P ""
sudo mkdir /var/lib/jenkins/.ssh/
cat /root/.ssh/id_rsa.pub >> /var/lib/jenkins/.ssh/authorized_keys
cat /var/lib/jenkins/.ssh/authorized_keys
cat /root/.ssh/id_rsa >> /root/private_key.txt
