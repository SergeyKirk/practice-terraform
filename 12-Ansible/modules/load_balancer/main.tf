resource "google_compute_global_address" "default" {
  name = var.load_balancer_ip_name
}

resource "google_compute_global_forwarding_rule" "default" {
  name                  = var.compute_global_forwarding_rule_name
  ip_protocol           = var.compute_global_forwarding_rule_ip_protocol
  load_balancing_scheme = var.load_balancing_scheme
  port_range            = var.forwarding_rule_port_range
  target                = google_compute_target_http_proxy.default.id
  ip_address            = google_compute_global_address.default.id
}

resource "google_compute_target_http_proxy" "default" {
  name    = var.compute_target_http_proxy_name
  url_map = google_compute_url_map.default.id
}

resource "google_compute_url_map" "default" {
  name            = var.compute_url_map_name
  default_service = google_compute_backend_service.default.id
}

resource "google_compute_backend_service" "default" {
  name                  = var.compute_backend_service_name
  protocol              = var.backend_service_protocol
  port_name             = var.port_name
  load_balancing_scheme = var.load_balancing_scheme
  timeout_sec           = var.time_out
  enable_cdn            = var.enable_cdn
  health_checks         = [google_compute_health_check.default.id]
  backend {
    group           = var.instance_group
    balancing_mode  = var.backend_balancing_mode
    capacity_scaler = var.backend_capacity_scaler
  }
}

resource "google_compute_health_check" "default" {
  name = var.compute_health_check_name
  http_health_check {
    port_specification = var.health_check_port_specification
  }
}
