provider "google" {
  project = var.project_id
  region  = var.region
}

data "google_container_engine_versions" "cluster_version" {
  location       = var.region
#  version_prefix = var.cluster_version
  project        = var.project_id
}

resource "google_container_cluster" "gke_cluster" {
  min_master_version = data.google_container_engine_versions.cluster_version.latest_node_version
  node_version       = data.google_container_engine_versions.cluster_version.latest_node_version
  name               = var.cluster_name
  network            = var.cluster_network
  subnetwork         = var.subnetwork
  location           = var.region

  ip_allocation_policy {}

  master_authorized_networks_config {
    cidr_blocks {
      cidr_block   = "10.0.1.0/24"
      display_name = "displayname"
    }
  }

  dynamic private_cluster_config {
    for_each = var.private_nodes ? [1]:[]
    content {
      enable_private_nodes    = var.private_nodes
      enable_private_endpoint = var.enable_private_endpoint
      master_ipv4_cidr_block  = var.master_ipv4_cidr_block
    }

  }

  dynamic "node_pool" {
    for_each = var.node_pools
    content {
      name               = node_pool.value.name
      initial_node_count = node_pool.value.initial_node_count
      management {
        auto_repair  = node_pool.value.management.auto_repair
        auto_upgrade = node_pool.value.management.auto_upgrade
      }
      autoscaling {
        min_node_count = node_pool.value.autoscaling.min_node_count
        max_node_count = node_pool.value.autoscaling.max_node_count
      }
      node_config {
        image_type      = node_pool.value.node_config.image_type
        disk_size_gb    = node_pool.value.node_config.disk_size_gb
        preemptible     = node_pool.value.node_config.preemptible
        machine_type    = node_pool.value.node_config.machine_type
        labels          = node_pool.value.node_config.labels
        service_account = node_pool.value.node_config.service_account
        metadata        = node_pool.value.node_config.metadata
      }
    }
  }
}
