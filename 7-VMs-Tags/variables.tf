variable "region" {
  type = string
}

variable "project_id" {
  type = string
}

variable "vm_names" {
  type = list(string)
}

variable "tags" {
  type = list(string)
}