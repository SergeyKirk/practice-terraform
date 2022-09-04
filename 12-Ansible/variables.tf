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