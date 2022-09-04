variable "files_path" {
  type        = string
  description = "The path to the files directory"
}

variable "zone" {
  type        = string
  description = "The zone to deploy to"
}
variable "region" {
  type        = string
  description = "The region to deploy to"
}
variable "project_id" {
  type        = string
  description = "The project to deploy to"
}


variable "vpc_network_name" {
  type        = string
  description = "The name of the VPC network to deploy to"
}


variable "instance_name" {
  type        = string
  description = "The name of the instance to deploy to"
}
variable "instance_type" {
  type        = string
  description = "The type of the instance to deploy to"
}
variable "image" {
  type        = string
  description = "The image of the instance to deploy to"
}
variable "nat_address_name" {
  type        = string
  description = "The name of the NAT address to deploy to"
}
variable "disk_size" {
  type        = number
  description = "The size of the disk to deploy to"
}
variable "master_service_account_email" {
  type        = string
  description = "The email of the master service account to deploy to"
}


variable "template_name" {
  type        = string
  description = "The name of the template to deploy to"
}
variable "mig_name" {
  type        = string
  description = "The name of the MIG to deploy to"
}
variable "base_instance_name" {
  type        = string
  description = "The name of the base instance to deploy to"
}


variable "bucket_name" {
  type        = string
  description = "The name of the bucket to deploy to"
}

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
  type        = number
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