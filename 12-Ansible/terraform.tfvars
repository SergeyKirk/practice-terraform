files_path = "/Users/sergey.kirakosyan/Documents/Coding/practice-terraform/"

zone       = "us-central1-a"
region     = "us-central1"
project_id = "vahan-dev"

vpc_network_name = "default"

instance_name                = "control-serg"
instance_type                = "e2-medium"
image                        = "ubuntu-1804-bionic-v20220824"
nat_address_name             = "master-ip"
disk_size                    = 50
master_service_account_email = "ansible-466@vahan-dev.iam.gserviceaccount.com"

template_name      = "worker-template"
mig_name           = "worker-mig"
base_instance_name = "worker-base"

bucket_name = "ansible-playbook"