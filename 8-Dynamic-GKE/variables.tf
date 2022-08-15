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
variable "min_desired_count" {
  type        = string
  description = "- (Required) Number of minimum desired nodes for the cluster."
}
variable "max_desired_count" {
  type        = string
  description = "- (Required) Number of maximum desired nodes for the cluster."
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

variable "machine_type" {
  type        = string
  default     = "n1-standard-2"
  description = "- (Optional) The name of a Google Compute Engine machine type. Defaults to n1-standard-1. "
}

variable "labels" {
  description = "- (Optional) Key Value Pairs of Labels to add to the nodes in the pool"
  type        = map(any)
  default = {
    labels = "fuchicorp-project"
  }
}

variable "disk_size_in_gb" {
  description = "- (Optional) Disk size, in GB, for the nodes in the pool."
  default     = "10"
}

variable "image_type" {
  default     = "COS"
  description = "image type"
}
variable "auto_repair" {
  description = "- (Optional) Whether the nodes will be automatically repaired"
  default     = true
}

variable "auto_upgrade" {
  description = "- (Optional) Whether the nodes will be automatically upgraded"
  default     = false
}

variable "node_version" {
  description = "- (Optional) The name of the GKE cluster to bind this node pool."
  default     = "1.17"
}

variable "min_master_version" {
  description = "- (Optional) The kubernetes version for the nodes in the pool. This should match the Kubernetes version of the GKE cluster."
  default     = "1.17"
}

variable "preemptible_nodes" {
  description = "- (Optional) Whether to use preemptible nodes"
  default     = false
}

#variable "node_pool" {
#  description = "- (Optional) Name of node pool"
#  type = list(string)
#}

variable "gce_ssh_user" {
  description = "- (Optional) ssh user"
  default     = "default-user"
}

variable "gce_ssh_pub_key_file" {
  description = "- (Optional) ssh pub key file"
  default     = "~/.ssh/id_rsa.pub"
}

variable "private_nodes" {
  type = bool
}

variable "enable_private_endpoint" {
  type = bool
}

variable "node_pools_separated_by_coma" {
  type = string
}