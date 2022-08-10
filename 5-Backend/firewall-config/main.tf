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
  name    = "test-firewall"
  network = "default"

  allow {
    protocol = "tcp"
    ports = ["80", "8080"]
  }

  source_ranges = ["0.0.0.0/0"]
}
