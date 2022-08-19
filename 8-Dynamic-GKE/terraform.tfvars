cluster_name = "cluster-1"

region                    = "us-central1-a"
project_id                = "eng-cell-351818"
cluster_node_count        = "2"
cluster_version           = "1.23"
node_pool_service_account = "terraform@eng-cell-351818.iam.gserviceaccount.com"
gce_ssh_user              = "default-user"
master_ipv4_cidr_block    = "172.16.0.16/28"

private_nodes           = true
enable_private_endpoint = false

node_pools = [
  {
    name               = "pool1"
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
      disk_size_gb = "10"
      preemptible  = false
      machine_type = "n1-standard-2"
      labels = {
        test = "test"
      }
      service_account = "terraform@eng-cell-351818.iam.gserviceaccount.com"
      metadata = {
        /* ssh-keys = "${var.gce_ssh_user}:${file(var.gce_ssh_pub_key_file)}" */
        disable-legacy-endpoints = "true"
      }
    }
  },
  {
    name               = "pool2"
    initial_node_count = 2
    management = {
      auto_repair  = true
      auto_upgrade = true
    }
    autoscaling = {
      min_node_count = 2
      max_node_count = 2
    }
    node_config = {
      image_type   = "cos_containerd"
      disk_size_gb = "10"
      preemptible  = true
      machine_type = "n1-standard-2"
      labels = {
        test = "mest"
      }
      service_account = "terraform@eng-cell-351818.iam.gserviceaccount.com"
      metadata = {
        /* ssh-keys = "${var.gce_ssh_user}:${file(var.gce_ssh_pub_key_file)}" */
        disable-legacy-endpoints = "true"
      }
    }
  }
]
