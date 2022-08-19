module "managed_dns" {
  source = "./modules/dns"

  name          = var.name
  dns_name      = var.dns_name
  description   = var.description
  project_id    = var.project_id
  force_destroy = var.force_destroy
  # dnssec_kind     = var.dnssec_kind
  # non_existence   = var.non_existence
  # state           = var.state
  # algorithm       = var.algorithm
  # key_length      = var.key_length
  # key_type_values = var.key_type_values.0
  # key_kind        = var.key_kind
  labels      = var.labels
  visibility  = var.visibility.0
  network_url = "projects/${var.project_id}/global/networks/${var.network}"
  # ipv4_address    = var.ipv4_address
  # forwarding_path = var.forwarding_path.0
}
