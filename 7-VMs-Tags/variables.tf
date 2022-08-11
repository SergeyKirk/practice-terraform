variable "region" {
  type = string
}

variable "project_id" {
  type = string
}

#variable "vm_names" {
#  type = list(string)
#}
#
#variable "tags" {
#  type = list(string)
#}

variable "vms_tags" {
  type = map(object({name = string, tags = list(string)}))
}