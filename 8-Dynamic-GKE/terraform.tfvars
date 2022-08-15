cluster_name = "cluster" # name of your cluster

region                    = "us-central1-a"   # region you wanna deploy to
project_id                = "eng-cell-351818" # your project id
cluster_node_count        = "2"
min_desired_count         = "2"
max_desired_count         = "5"
cluster_version           = "1.23"
image_type                = "cos_containerd"
disk_size_in_gb           = "10"
machine_type              = "n1-standard-2"
node_pool_service_account = "terraform@eng-cell-351818.iam.gserviceaccount.com"
auto_repair               = true
auto_upgrade              = false
gce_ssh_user              = "default-user"
master_ipv4_cidr_block    = "172.16.0.16/28"

labels = {
  "label" = "label"
}
