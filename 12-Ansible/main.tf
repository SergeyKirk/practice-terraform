module "storage" {
  source = "./modules/bucket/"
  bucket_name = var.bucket_name
  files_path = var.files_path
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
  bucket = module.storage.bucket
  files_path = var.files_path
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