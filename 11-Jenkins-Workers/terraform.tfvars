vpc_network_name = "default"
instance_names   = ["jenkins-master-serg", "jenkins-worker-serg"]
zone             = "us-central1-a"
region           = "us-central1"
instance_type    = "e2-medium"
image            = "centos-7-v20220822"
project_id       = "vahan-dev"
nat_addresses    = ["master-ip", "worker-ip"]
disk_size        = 50