provider "google" {
  project = var.project_id
  region  = var.region
}

module "compute" {
  source = "./modules/compute/"
  #  tag_list = var.tags
  #  vm_list  = var.vm_names
  vms_tags = var.vms_tags
}
