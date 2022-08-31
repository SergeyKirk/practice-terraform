cluster_name = "sergey-jenkins"

gce_ssh_user           = "default-user"
master_ipv4_cidr_block = "172.16.0.16/28"

network = "default"

private_nodes           = false
enable_private_endpoint = false

node_pools = [
  {
    name               = "jenkins"
    initial_node_count = 3
    management = {
      auto_repair  = true
      auto_upgrade = true
    }
    autoscaling = {
      min_node_count = 3
      max_node_count = 3
    }
    node_config = {
      image_type   = "cos_containerd"
      disk_size_gb = "50"
      preemptible  = false
      machine_type = "e2-medium"
      labels = {
        jenkins = "true"
      }
      service_account = "jenkins-124@vahan-dev.iam.gserviceaccount.com"
      metadata = {
        /* ssh-keys = "${var.gce_ssh_user}:${file(var.gce_ssh_pub_key_file)}" */
        disable-legacy-endpoints = "true"
      }
    }
  }
]

instance_name = "jenkins-worker-serg"
zone          = "us-central1-a"
region        = "us-central1"
instance_type = "e2-medium"
image         = "centos-7-v20220822"
project_id    = "vahan-dev"
disk_size     = 50
machine_type = "e2-medium"