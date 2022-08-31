module "gke" {
  source                  = "./modules/GKE/"
  cluster_name            = var.cluster_name
  cluster_network         = var.network
  enable_private_endpoint = var.enable_private_endpoint
  gce_ssh_user            = var.gce_ssh_user
  master_ipv4_cidr_block  = var.master_ipv4_cidr_block
  node_pools              = var.node_pools
  private_nodes           = var.private_nodes
  project_id              = var.project_id
  region                  = var.region
}

module "compute" {
  source        = "./modules/compute"
  disk_size     = var.disk_size
  image         = var.image
  instance_name = var.instance_name
  instance_type = var.instance_type
  project_id    = var.project_id
  region        = var.region
  zone          = var.zone
  network       = var.network
  machine_type  = var.machine_type
}