resource "google_compute_instance_template" "ansible_worker" {
  name           = var.template_name
  machine_type   = var.instance_type
  can_ip_forward = var.can_ip_forward

  scheduling {
    automatic_restart   = var.scheduling_automatic_restart
    on_host_maintenance = var.on_host_maintenance
  }

  disk {
    source_image = var.image
    auto_delete  = var.disk_auto_delete
    boot         = var.disk_boot
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

  target_size = var.mig_target_size

  named_port {
    name = var.port_name
    port = var.port
  }
}
