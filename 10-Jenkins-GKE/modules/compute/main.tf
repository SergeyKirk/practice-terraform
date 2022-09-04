resource "google_compute_address" "worker_ip" {
  name   = "worker-ip"
  region = var.region
}


resource "google_compute_instance" "worker" {
  name         = var.instance_name
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = var.image
      size  = var.disk_size
    }
  }
  service_account {
    email  = "jenkins-124@vahan-dev.iam.gserviceaccount.com"
    scopes = ["cloud-platform"]
  }
  network_interface {
    network = var.network
    access_config {
      nat_ip = google_compute_address.worker_ip.address
    }
  }
  #  metadata_startup_script = file("./modules/compute/worker.sh")
}