provider "google" {
  project = var.project_id
  region  = var.region
}

module "network" {
  source               = "./modules/network/"
  vpc_network          = var.vpc_name
  firewall_rules_names = var.firewall_rules_names
}

module "compute" {
  source         = "./modules/compute/"
  vpc_network    = module.network.network_name
  instance_names = var.instance_names
  zone           = var.zone
  instance_type  = var.instance_type
  image          = var.image
}

#module "sql" {
#  source = "./modules/sql/"
#}