variable "zone" {
  type    = string
  default = "us-central1-c"
}

variable "region" {
  type    = string
  default = "us-central1"
}

variable "machine_type" {
  type    = string
  default = "e2-medium"
}

variable "machine_image" {
  type    = string
  default = "centos-stream-9-v20220519"
}