variable "region" {}
variable "project_id" {}

variable "vpc_name" {}

variable "firewall_rules_names" { type = list(string) }

variable "instance_names" { type = list(string) }

variable "zone" {}
variable "instance_type" {}
variable "image" {}