provider "google" {
  project = var.project_id
  region  = var.region
}

terraform {
  backend "gcs" {
    bucket = "bucket-2-3-2-3"
    prefix = "firewall/"
  }
}

resource "google_compute_firewall" "default" {
  for_each = toset(var.firewall_rules_names)
  name     = each.key
  network  = "default"

  dynamic "allow" {
    for_each = local.allow_rule
    content {
      protocol = allow.value.protocol
      ports    = allow.value.ports
    }
  }

  source_ranges = ["0.0.0.0/0"]
}
