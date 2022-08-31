resource "google_compute_address" "master_ip" {
  name     = var.nat_addresses.0
  region = var.region
}

resource "google_compute_address" "worker_ip" {
  name     = var.nat_addresses.1
  region = var.region
}

resource "google_compute_firewall" "allow_all" {
  name    = "allow-all"
  network = "default"
  allow {
    protocol = "tcp"
    ports    = ["80", "443", "8080", "22"]
  }

  source_ranges = ["0.0.0.0/0"]

}

resource "google_compute_instance" "master" {
  name         = var.instance_names.0
  machine_type = var.instance_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = var.image
      size  = var.disk_size
    }
  }

  network_interface {
    network = var.vpc_network_name
    access_config {
      nat_ip = google_compute_address.master_ip.address
    }
  }
  metadata_startup_script = file("master.sh")
}

resource "google_compute_instance" "worker" {
  name         = var.instance_names.1
  machine_type = var.instance_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = var.image
      size  = var.disk_size
    }
  }

  network_interface {
    network = var.vpc_network_name
    access_config {
      nat_ip = google_compute_address.worker_ip.address
    }
  }
#  metadata_startup_script = file("worker.sh")
}