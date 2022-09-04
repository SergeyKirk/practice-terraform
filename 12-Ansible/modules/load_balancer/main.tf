resource "google_compute_global_address" "default" {
  name = "l7-xlb-static-ip"
}

resource "google_compute_global_forwarding_rule" "default" {
  name                  = "l7-xlb-forwarding-rule"
  ip_protocol           = "TCP"
  load_balancing_scheme = "EXTERNAL"
  port_range            = "80"
  target                = google_compute_target_http_proxy.default.id
  ip_address            = google_compute_global_address.default.id
}

resource "google_compute_target_http_proxy" "default" {
  name = "l7-xlb-target-http-proxy"
  url_map = google_compute_url_map.default.id
}

resource "google_compute_url_map" "default" {
  name = "l7-xlb-url-map"
  default_service = google_compute_backend_service.default.id
}

resource "google_compute_backend_service" "default" {
  name = "l7-xlb-backend-service"
  #  provider                 = google-beta
  protocol                = "HTTP"
  port_name               = "custom-http"
  load_balancing_scheme   = "EXTERNAL"
  timeout_sec             = 10
  enable_cdn              = false
#  custom_request_headers  = ["X-Client-Geo-Location: {client_region_subdivision}, {client_city}"]
#  custom_response_headers = ["X-Cache-Hit: {cdn_cache_status}"]
  health_checks           = [google_compute_health_check.default.id]
  backend {
    group           = var.instance_group
    balancing_mode  = "UTILIZATION"
    capacity_scaler = 1.0
  }
}

resource "google_compute_health_check" "default" {
  name = "l7-xlb-hc"
  http_health_check {
    port_specification = "USE_SERVING_PORT"
  }
}
