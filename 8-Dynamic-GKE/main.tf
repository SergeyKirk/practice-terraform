provider "google" {
  project = var.project_id
  region  = var.region
}

#resource "google_container_cluster" "gke-cluster" {
#  name               = var.cluster_name
#  location           = var.location
#  initial_node_count = var.initial_node_count
#  network            = var.vpc_name
#  subnetwork         = var.subnet_name
#  networking_mode    = var.networking_mode
#
#  ip_allocation_policy {
#    cluster_ipv4_cidr_block = var.cluster_ipv4_cidr_block
#  }
#
#  node_config {
#    service_account = var.service_account_id
#    preemptible     = var.preemptible
#    machine_type    = var.machine_type
#    disk_size_gb    = var.disk_size_gb
#    oauth_scopes    = var.oauth_scopes
#  }
#
#  private_cluster_config {
#    enable_private_nodes    = var.enable_private_nodes
#    enable_private_endpoint = var.enable_private_endpoint
#    # master_ipv4_cidr_block  = var.master_ipv4_cidr_block
#  }
#}

data "google_container_engine_versions" "cluster_version" {
  location       = var.region
  version_prefix = var.cluster_version
  project        = var.project_id
}

resource "google_container_cluster" "gke_cluster" {
  min_master_version = data.google_container_engine_versions.cluster_version.latest_node_version #This is the lastest version of the cluster_version variable
  node_version       = data.google_container_engine_versions.cluster_version.latest_node_version
  name               = var.cluster_name
  network            = var.cluster_network
  subnetwork         = var.subnetwork
  location           = var.region

  ip_allocation_policy {

  }

  /* master_authorized_networks_config {
    cidr_blocks {
      cidr_block   = "10.0.1.0/24"
      display_name = "displayname"
    }
  } */

  private_cluster_config {
    enable_private_nodes    = true
    enable_private_endpoint = false # If you wish to make this value then please uncomment the code from line number 20-24 as it is required when you enable private endpoint in GKE
    master_ipv4_cidr_block  = var.master_ipv4_cidr_block
  }
  node_pool {
    name               = var.node_pool
    initial_node_count = var.cluster_node_count
    management {
      auto_repair  = var.auto_repair
      auto_upgrade = var.auto_upgrade
    }
    autoscaling {
      min_node_count = var.min_desired_count
      max_node_count = var.max_desired_count
    }
    node_config {
      image_type      = var.image_type
      disk_size_gb    = var.disk_size_in_gb
      preemptible     = var.preemptible_nodes
      machine_type    = var.machine_type
      labels          = var.labels
      service_account = var.node_pool_service_account
      metadata = {
        /* ssh-keys = "${var.gce_ssh_user}:${file(var.gce_ssh_pub_key_file)}" */
        disable-legacy-endpoints = "true"
      }
    }
  }
}
