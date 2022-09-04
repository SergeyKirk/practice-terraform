resource "google_compute_instance_template" "ansible_worker" {
  name           = var.template_name
  machine_type   = var.instance_type
  can_ip_forward = false

  scheduling {
    automatic_restart   = true
    on_host_maintenance = "MIGRATE"
  }

  disk {
    source_image = var.image
    auto_delete  = true
    boot         = true
  }

  network_interface {
    network = var.vpc_network_name
    access_config {}
  }

}

resource "google_compute_instance_group_manager" "worker_servers" {
  name = var.mig_name

  base_instance_name = var.base_instance_name
  zone               = var.zone

  version {
    instance_template = google_compute_instance_template.ansible_worker.id
  }

  target_size = 3

  named_port {
    name = "customhttp"
    port = 8888
  }

}
