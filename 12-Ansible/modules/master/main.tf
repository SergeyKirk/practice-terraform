resource "google_compute_address" "master_ip" {
  name   = var.nat_address_name
  region = var.region
}

resource "google_compute_instance" "master" {
  name         = var.instance_name
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
  service_account {
    email  = var.service_account_email
    scopes = ["cloud-platform"]
  }

  depends_on              = [var.bucket]
#  metadata_startup_script = file("${var.files_path}/modules/master/password_setup.sh")

  connection {
    type     = "ssh"
    user     = "root"
    host     = google_compute_address.master_ip.address
#    password = "root"
  }

  provisioner "file" {
    source      = "${var.files_path}/modules/master/control.sh"
    destination = "/tmp/control.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/control.sh",
      "/tmp/control.sh"
    ]
  }

}
