variable "zone" {
  type = string
  description = "The zone to deploy to"
}

variable "template_name" {
  type = string
    description = "The name of the template to deploy"
}
variable "instance_type" {
  type = string
  description = "Instance type"
}
variable "image" {
  type = string
  description = "Image of instances"
}
variable "mig_name" {
    type = string
    description = "Name of the managed instance group"
}
variable "base_instance_name" {
    type = string
    description = "Base name of the instances"
}

variable "vpc_network_name" {
    type = string
    description = "Name of the VPC network"
}

variable "mig_target_size" {
  type        = number
  description = "MIG target size"
}
