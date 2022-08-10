provider "google" {
  project = "sada-sergey-kirakosyan-sandbox"
  region  = var.region
}

resource "google_compute_address" "ip_address_master" {
  name   = "ip-master"
  region = var.region
}

resource "google_compute_address" "ip_address_worker1" {
  name   = "ip-worker1"
  region = var.region
}

resource "google_compute_address" "ip_address_worker2" {
  name   = "ip-worker2"
  region = var.region
}


resource "google_compute_instance" "master" {
  name         = "cluster-master"
  machine_type = var.machine_type
  zone         = var.zone
  boot_disk {
    initialize_params {
      image = var.machine_image
    }
  }
  service_account {
    scopes = ["cloud-platform"]
  }

  network_interface {
    network = "default"
    access_config {
      nat_ip = google_compute_address.ip_address_master.address
    }
  }
  metadata_startup_script = file("master_setup.sh")

}


resource "google_compute_instance" "workers-1" {
  name         = "cluster-worker-1"
  machine_type = var.machine_type
  zone         = var.zone
  boot_disk {
    initialize_params {
      image = var.machine_image
    }
  }
  service_account {
    scopes = ["cloud-platform"]
  }

  network_interface {
    network = "default"
    access_config {
      nat_ip = google_compute_address.ip_address_worker1.address
    }
  }

  metadata_startup_script = file("worker_setup.sh")

}

resource "google_compute_instance" "worker-2" {
  name         = "cluster-worker-2"
  machine_type = var.machine_type
  zone         = var.zone
  boot_disk {
    initialize_params {
      image = var.machine_image
    }
  }
  service_account {
    scopes = ["cloud-platform"]
  }

  network_interface {
    network = "default"
    access_config {
      nat_ip = google_compute_address.ip_address_worker2.address
    }
  }

  metadata_startup_script = file("worker_setup.sh")

}