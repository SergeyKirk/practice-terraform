locals {

}

resource "google_compute_instance" "vms" {
  machine_type = "f1-micro"
  for_each     = var.vms_tags
  name         = each.value.name
  tags         = each.value.tags

  zone = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-10-buster-v20220719"
    }
  }

  network_interface {
    network = "default"
  }
}