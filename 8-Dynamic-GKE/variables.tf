variable "project_id" {
  description = "- (Required)  Google account project id."
}
variable "region" {
  type        = string
  description = "- (Required) Google region where the cluster will be deployed."
}
variable "cluster_version" {
  type        = string
  description = "- (Required) Version of the cluster."
}
variable "cluster_node_count" {
  type        = string
  description = "- (Required) Number of nodes for the cluster."
}

variable "master_ipv4_cidr_block" {
  type        = string
  description = "IP range for the control plane"
  default     = "172.16.0.16/28"
}
variable "cluster_network" {
  type        = string
  default     = "default"
  description = "- (Optional) The name or self_link of the Google Compute Engine network to which the cluster is connected. For Shared VPC, set this to the self link of the shared network."
}

variable "node_pool_service_account" {
  type        = string
  description = "Service account to be associated with NodePools"
}

variable "cluster_name" {
  type        = string
  description = "- (Required) The name of the cluster, unique within the project and location."
}

variable "subnetwork" {
  type        = string
  default     = "default"
  description = "- (Optional) The name or self_link of the Google Compute Engine subnetwork in which the cluster's instances are launched."
}

variable "node_version" {
  description = "- (Optional) The name of the GKE cluster to bind this node pool."
  default     = "1.17"
}

variable "min_master_version" {
  description = "- (Optional) The kubernetes version for the nodes in the pool. This should match the Kubernetes version of the GKE cluster."
  default     = "1.17"
}

variable "gce_ssh_user" {
  description = "- (Optional) ssh user"
  default     = "default-user"
}

variable "gce_ssh_pub_key_file" {
  description = "- (Optional) ssh pub key file"
  default     = "~/.ssh/id_rsa.pub"
}

variable "private_nodes" {
  type    = bool
  default = false
}

variable "enable_private_endpoint" {
  type = bool
}

variable "node_pools" {
  type = list(object({
    name               = string
    initial_node_count = number
    management         = object({ auto_repair = bool, auto_upgrade = bool })
    autoscaling        = object({ min_node_count = number, max_node_count = number })
    node_config = object({
      image_type      = string
      disk_size_gb    = string
      preemptible     = bool
      machine_type    = string
      labels          = map(any)
      service_account = string
      metadata        = object({ disable-legacy-endpoints = string })
    })
  }))
}
