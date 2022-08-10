provider "google" {
  project = var.project_id
  region  = var.region
}

module "network" {
  source               = "./modules/network/"
  vpc_network_names    = var.vpc_network_names
  firewall_rules_names = var.firewall_rules_names
}

module "compute" {
  source         = "./modules/compute/"
  network_name   = module.network.network_name
  instance_names = var.instance_names
  zone           = var.zone
  instance_type  = var.instance_type
  image          = var.image
}

#module "sql" {
#  source = "./modules/sql/"
#}