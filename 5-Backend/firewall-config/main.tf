provider "google" {
  project = var.project_id
  region  = var.region
}

resource "google_compute_firewall" "default" {
  name    = "test-firewall"
  network = "default"

  allow {
    protocol = "tcp"
    ports = ["80", "8080"]
  }

  source_ranges = ["0.0.0.0/0"]
}
