variable "region" {}
variable "project_id" {}

variable "vpc_network_names" {
  type = map(string)
}
variable "firewall_rules_names" { type = list(string) }

variable "instance_names" { type = list(string) }

variable "zone" {}
variable "instance_type" {}
variable "image" {}