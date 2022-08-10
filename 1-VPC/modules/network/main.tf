resource "google_compute_network" "vpc_network" {
  name                    = var.vpc_network_name
  auto_create_subnetworks = false
  mtu                     = 1460
}

resource "google_compute_subnetwork" "sub" {
  ip_cidr_range = var.cidr_range
  name          = var.subnetwork_name
  network       = google_compute_network.vpc_network.id
}