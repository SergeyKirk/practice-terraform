locals {
  node_pools = split(", ", var.node_pools_separated_by_coma)
}
