resource "google_compute_instance" "vm" {
  for_each = toset(var.instance_names)
  name         = each.key
  machine_type = var.instance_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = var.image
    }
  }

  network_interface {
    network = var.network_name
  }

  metadata_startup_script = file("./modules/compute/startup.sh")

}