variable "instance_group" {}

variable "load_balancer_ip_name" {
  type        = string
  description = "The name of the load balancer IP to deploy to"
}

variable "compute_global_forwarding_rule_name" {
  type        = string
  description = "Global forwarding rule name"
}

variable "compute_global_forwarding_rule_ip_protocol" {
  type        = string
  description = "Forwarding ip protocol"
}

variable "load_balancing_scheme" {
  type        = string
  description = "Load balancing scheme"
}

variable "forwarding_rule_port_range" {
  type        = string
  description = "Forwarding port range"
}

variable "compute_target_http_proxy_name" {
  type        = string
  description = "Compute target http proxy name"
}

variable "compute_url_map_name" {
  type        = string
  description = "Compute url map name"
}

variable "compute_backend_service_name" {
  type        = string
  description = "Compute backend service name"
}

variable "backend_service_protocol" {
  type        = string
  description = "Backend service protocol"
}

variable "port_name" {
  type        = string
  description = "Port name"
}

variable "time_out" {
  type        = string
  description = "Time out"
}

variable "enable_cdn" {
  type        = bool
  description = "Enable CDN"
}

variable "backend_balancing_mode" {
  type        = string
  description = "Backend balancing mode"
}

variable "backend_capacity_scaler" {
  type        = number
  description = "Backend capacity scaler"
}

variable "compute_health_check_name" {
  type        = string
  description = "Compute health check name"
}

variable "health_check_port_specification" {
  type        = string
  description = "Health check port specification"
}
