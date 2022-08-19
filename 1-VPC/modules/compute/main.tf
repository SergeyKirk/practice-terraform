resource "google_compute_instance" "instance" {
  name         = var.instance_name
  machine_type = var.instance_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = var.image
    }
  }

  network_interface {
    network    = var.network_name
    subnetwork = var.subnetwork_name
  }

}