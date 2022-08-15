provider "google" {
  project = var.project_id
  region  = var.region
}

resource "google_container_cluster" "gke-cluster" {
  name               = var.cluster_name
  location           = var.location
  initial_node_count = var.initial_node_count
  network            = var.vpc_name
  subnetwork         = var.subnet_name
  networking_mode    = var.networking_mode

  ip_allocation_policy {
    cluster_ipv4_cidr_block = var.cluster_ipv4_cidr_block
  }

  node_config {
    preemptible     = var.preemptible
    machine_type    = var.machine_type
    disk_size_gb    = var.disk_size_gb
    oauth_scopes    = var.oauth_scopes
  }

  private_cluster_config {
    enable_private_nodes    = var.enable_private_nodes
    enable_private_endpoint = var.enable_private_endpoint
    # master_ipv4_cidr_block  = var.master_ipv4_cidr_block
  }
}
