provider "google" {
  project = var.project_id
  region  = var.region
}

#provider "kubernetes" {}

data "google_container_engine_versions" "cluster_version" {
  location       = var.region
  version_prefix = var.cluster_version
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

  /* master_authorized_networks_config {
    cidr_blocks {
      cidr_block   = "10.0.1.0/24"
      display_name = "displayname"
    }
  } */

  dynamic private_cluster_config {
    for_each = var.private_nodes ? [1] : []

    content {
      enable_private_nodes    = var.private_nodes
      enable_private_endpoint = var.enable_private_endpoint
      master_ipv4_cidr_block  = var.master_ipv4_cidr_block
    }
  }

  dynamic node_pool {
    for_each = local.node_pools
    content {
      name               = node_pool.value
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
}

#resource "kubernetes_deployment" "deployment" {
#  metadata {
#    name = "example"
#    labels = {
#      test = "example"
#    }
#  }
#
#  spec {
#    replicas = 3
#
#    selector {
#      match_labels = {
#        test = "example"
#      }
#    }
#
#    template {
#      metadata {
#        labels = {
#          test = "example"
#        }
#      }
#
#      spec {
#        container {
#          image = "ubuntu/apache2"
#          name  = "example"
#
#          #          liveness_probe {
#          #            http_get {
#          #              path = "/"
#          #              port = 80
#          #
#          #              http_header {
#          #                name  = "X-Custom-Header"
#          #                value = "Awesome"
#          #              }
#          #            }
#          #
#          #            initial_delay_seconds = 3
#          #            period_seconds        = 3
#          #          }
#        }
#      }
#    }
#  }
#}
