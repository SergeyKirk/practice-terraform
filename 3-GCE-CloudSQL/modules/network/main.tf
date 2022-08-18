#resource "google_compute_network" "vpc_network" {
#  for_each = var.vpc_network
#  name                    = each.value
#  auto_create_subnetworks = true
#  mtu                     = 1460
#}

resource "google_compute_firewall" "ingress" {
  for_each = toset(var.firewall_rules_names)
  name    = each.key
  network = var.vpc_network

  allow {
    protocol = "all"
  }

  source_ranges = ["0.0.0.0/0"]
}