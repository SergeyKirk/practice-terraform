provider "google" {
  project = "sada-sergey-kirakosyan-sandbox"
  region = var.region
}

module "network" {
  source = "./modules/network/"
  cidr_range = var.cidr_range
  subnetwork_name = var.subnetwork_name
  vpc_network_name = var.vpc_network_name
}

module "compute" {
  source = "./modules/compute/"
  instance_name = var.instance_name
  zone = var.zone
  instance_type = var.instance_type
  image = var.image
  network_name = module.network.vpc_output_name
  subnetwork_name = module.network.subnetwork_output_name
}
