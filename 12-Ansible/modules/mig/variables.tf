variable "zone" {
  type        = string
  description = "The zone to deploy to"
}

variable "template_name" {
  type        = string
  description = "The name of the template to deploy"
}
variable "instance_type" {
  type        = string
  description = "Instance type"
}
variable "image" {
  type        = string
  description = "Image of instances"
}
variable "mig_name" {
  type        = string
  description = "Name of the managed instance group"
}
variable "base_instance_name" {
  type        = string
  description = "Base name of the instances"
}

variable "vpc_network_name" {
  type        = string
  description = "Name of the VPC network"
}

variable "mig_target_size" {
  type        = number
  description = "MIG target size"
}

variable "region" {
  type        = string
  description = "The region to deploy to"
}

variable "on_host_maintenance" {
  type        = string
  description = "On host maintenance"
}

variable "port_name" {
  type        = string
  description = "Port name"
}

variable "port" {
    type        = number
    description = "Port"
}

variable "disk_auto_delete" {
    type        = bool
    description = "Disk auto delete"
}

variable "disk_boot" {
    type        = bool
    description = "Disk boot"
}

variable "scheduling_automatic_restart" {
    type        = bool
    description = "Scheduling automatic restart"
}

variable "can_ip_forward" {
    type        = bool
    description = "Can ip forward"
}
