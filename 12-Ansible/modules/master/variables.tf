variable "vpc_network_name" {
  type        = string
  description = "The name of the VPC network to create"
}
variable "nat_address_name" {
  type        = string
  description = "Name of the NAT address"
}

variable "instance_name" {
  type        = string
  description = "Name of the instance"
}
variable "instance_type" {
  type        = string
  description = "The type of instance to create"
}
variable "image" {
  type        = string
  description = "The image to use for the instance"
}
variable "disk_size" {
  type        = number
  description = "Disk size in GB"
}
variable "service_account_email" {
  type        = string
  description = "The service account email to use for the instance"
}

variable "zone" {
  type        = string
  description = "The zone to deploy the instance into"
}
variable "region" {
  type        = string
  description = "The region to deploy to"
}
variable "project_id" {
  type        = string
  description = "The project ID to deploy to"
}

variable "bucket" {
  description = "The name of the bucket to create"
}


variable "files_path" {
  type        = string
  description = "The path to the files directory"
}
