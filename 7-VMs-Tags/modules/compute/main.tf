locals {
  joined_tags_vms = zipmap(var.vm_list, var.tag_list)
}

resource "google_compute_instance" "vms" {
  machine_type = "f1-micro"
  for_each = local.joined_tags_vms
  name        = each.key
  tags = [each.value]

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