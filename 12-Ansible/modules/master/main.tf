resource "google_storage_bucket" "ansible" {
  name          = "ansible-playbook"
  location      = "US"
  force_destroy = true

  provisioner "local-exec" {
    command = "chmod +x /Users/sergey.kirakosyan/Documents/Coding/practice-terraform/12-Ansible/modules/master/bucket.sh && /Users/sergey.kirakosyan/Documents/Coding/practice-terraform/12-Ansible/modules/master/bucket.sh"
  }
}

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

  depends_on = [google_storage_bucket.ansible]
  metadata_startup_script = file("/Users/sergey.kirakosyan/Documents/Coding/practice-terraform/12-Ansible/modules/master/control.sh")


  #  provisioner "file" {
  #    source      = "/Users/sergey.kirakosyan/Documents/Coding/practice-terraform/12-Ansible/apache2/hosts_var"
  #    destination = "/tmp/hosts_var"
  #  }
  #
  #  provisioner "file" {
  #    source      = "/Users/sergey.kirakosyan/Documents/Coding/practice-terraform/12-Ansible/apache2/httpd.conf"
  #    destination = "/tmp/httpd.conf"
  #  }
  #
  #  provisioner "file" {
  #    source      = "/Users/sergey.kirakosyan/Documents/Coding/practice-terraform/12-Ansible/apache2/index.html"
  #    destination = "/tmp/index.html"
  #  }
  #
  #  provisioner "file" {
  #    source      = "/Users/sergey.kirakosyan/Documents/Coding/practice-terraform/12-Ansible/apache2/play.yaml"
  #    destination = "/tmp/play.yaml"
  #  }
  #  connection {
  #    type     = "ssh"
  #    user     = "root"
  #    host = google_compute_address.master_ip.address
  #  }
  #
  #
  #  provisioner "remote-exec" {
  #    inline = [
  #      "chmod +x /tmp/control.sh",
  #      "/tmp/control.sh args",
  #    ]
  #  }
}

