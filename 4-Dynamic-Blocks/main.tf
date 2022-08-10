provider "google" {
  project = var.project_id
  region  = var.region
}

resource "google_compute_firewall" "default" {
  name    = "test-firewall"
  network = "default"

  dynamic "allow" {
    for_each = local.allow_rule
    content {
      protocol = allow.value.protocol
      ports = allow.value.ports
    }
  }

  source_ranges = ["0.0.0.0/0"]
}
