variable "name" {
  description = "The name of the Managed Zone"
  type        = string
}

variable "dns_name" {
  description = "The DNS name of the Managed Zone"
  type        = string
}

variable "description" {
  description = "The description of the Managed Zone"
  type        = string
}

variable "project_id" {
  description = "The project ID of the Managed Zone"
  type        = string
}

variable "force_destroy" {
  description = "Whether to force destroy the Managed Zone"
  type        = bool
}

# variable "dnssec_kind" {
#   description = "the kind of dnssec config to use"
#   type        = string
# }

# variable "non_existence" {
#   description = "the non existence of dnssec config to use"
#   type        = string
# }

# variable "state" {
#   description = "the state of dnssec config to use"
#   type        = string
# }

# variable "algorithm" {
#   description = "the algorithm of dnssec config to use"
#   type        = string
# }

# variable "key_length" {
#   description = "the key length of dnssec config to use"
#   type        = number
# }

# variable "key_type_values" {
#   description = "the key type of dnssec config to use"
#   type        = string
# }

# variable "key_kind" {
#   description = "the key kind of dnssec config to use"
#   type        = string
# }

variable "labels" {
  description = "the first label of the labels"
  type        = object({ first = string, second = string })
}

variable "visibility" {
  description = "the visibility of the Managed Zone"
  type        = string
}

# variable "ipv4_address" {
#   description = "the ipv4 address of the Managed Zone"
#   type        = string
# }

# variable "forwarding_path" {
#   description = "the forwarding path of the Managed Zone"
#   type        = string
# }

variable "network_url" {
  description = "the network url of the Managed Zone"
  type        = string
}