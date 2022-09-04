sudo su

apt-get update -y
apt-get install python3 -y
apt-get install python3-pip -y
pip3 install ansible

ssh-keygen -t rsa -N '' -f ~/.ssh/id_rsa
sed -i '1s/^/root:/' /root/.ssh/id_rsa.pub
gcloud compute project-info add-metadata --metadata-from-file=ssh-keys=/root/.ssh/id_rsa.pub

gcloud compute instances list --format="get(name)" | grep worker-base >> /root/instance_names.txt
mkdir /etc/ansible/
touch /etc/ansible/hosts
while read -r line; do gcloud compute instances describe "$line" --format='get(networkInterfaces[0].accessConfigs[0].natIP)' --zone=us-central1-a >> /etc/ansible/hosts; done < /root/instance_names.txt

export ANSIBLE_HOST_KEY_CHECKING=False

gsutil cp gs://ansible-playbook/hosts_var /tmp/hosts_var
gsutil cp gs://ansible-playbook/play.yaml /tmp/play.yaml
gsutil cp gs://ansible-playbook/httpd.conf /tmp/httpd.conf
gsutil cp gs://ansible-playbook/index.html /tmp/index.html

ansible-playbook /tmp/play.yaml
