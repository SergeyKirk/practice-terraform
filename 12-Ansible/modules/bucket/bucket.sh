gcloud compute project-info add-metadata --metadata-from-file=ssh-keys=/Users/sergey.kirakosyan/.ssh/id_rsa.pub
gsutil cp "$DIR"/apache2/play.yaml gs://ansible-playbook
gsutil cp "$DIR"/apache2/index.html gs://ansible-playbook
gsutil cp "$DIR"/apache2/hosts_var gs://ansible-playbook
gsutil cp "$DIR"/apache2/httpd.conf gs://ansible-playbook
