module "storage" {
  source      = "./modules/bucket/"
  bucket_name = var.bucket_name
  files_path  = var.files_path
}

module "master" {
  source                = "./modules/master/"
  disk_size             = var.disk_size
  image                 = var.image
  instance_name         = var.instance_name
  instance_type         = var.instance_type
  nat_address_name      = var.nat_address_name
  project_id            = var.project_id
  region                = var.region
  service_account_email = var.master_service_account_email
  vpc_network_name      = var.vpc_network_name
  zone                  = var.zone
  bucket                = module.storage.bucket
  files_path            = var.files_path
}

module "worker" {
  source             = "./modules/mig/"
  template_name      = var.template_name
  image              = var.image
  instance_type      = var.instance_type
  zone               = var.zone
  vpc_network_name   = var.vpc_network_name
  mig_name           = var.mig_name
  base_instance_name = var.base_instance_name
}

module "load_balancer" {
  source                                     = "./modules/load_balancer/"
  instance_group                             = module.worker.instance_group
  load_balancer_ip_name                      = var.load_balancer_ip_name
  compute_global_forwarding_rule_name        = var.compute_global_forwarding_rule_name
  compute_global_forwarding_rule_ip_protocol = var.compute_global_forwarding_rule_ip_protocol
  load_balancing_scheme                      = var.load_balancing_scheme
  forwarding_rule_port_range                 = var.forwarding_rule_port_range
  backend_balancing_mode                     = var.backend_balancing_mode
  backend_capacity_scaler                    = var.backend_capacity_scaler
  backend_service_protocol                   = var.backend_service_protocol
  compute_backend_service_name               = var.compute_backend_service_name
  compute_health_check_name                  = var.compute_health_check_name
  compute_target_http_proxy_name             = var.compute_target_http_proxy_name
  compute_url_map_name                       = var.compute_url_map_name
  enable_cdn                                 = var.enable_cdn
  health_check_port_specification            = var.health_check_port_specification
  port_name                                  = var.port_name
  time_out                                   = var.time_out
}