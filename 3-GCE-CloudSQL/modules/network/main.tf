locals {
  vpc_list = google_compute_network.vpc_network.*.name1.name
  vpc_name = local.vpc_list.0
}

resource "google_compute_network" "vpc_network" {
  for_each = var.vpc_network_names
  name                    = each.value
  auto_create_subnetworks = true
  mtu                     = 1460
}

resource "google_compute_firewall" "ingress" {
  name    = var.firewall_rules_names.0
  network = local.vpc_name

  allow {
    protocol = "all"
  }

  source_ranges = ["0.0.0.0/0"]
}