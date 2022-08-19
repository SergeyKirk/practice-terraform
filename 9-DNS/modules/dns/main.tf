resource "google_dns_managed_zone" "private-zone" {
  name          = var.name
  dns_name      = var.dns_name
  description   = var.description
  project       = var.project_id
  force_destroy = var.force_destroy

  # Private zones do not support dnssec 

  # dnssec_config {
  #   kind          = var.dnssec_kind
  #   non_existence = var.non_existence
  #   state         = var.state
  #   default_key_specs {
  #     algorithm  = var.algorithm
  #     key_length = var.key_length
  #     key_type   = var.key_type_values
  #     kind       = var.key_kind
  #   }
  # }

  labels = var.labels

  visibility = var.visibility

  private_visibility_config {
    networks {
      network_url = var.network_url
    }
  }

  # forwarding_config {
  #   target_name_servers {
  #     ipv4_address    = var.ipv4_address
  #     forwarding_path = var.forwarding_path
  #   }
  # }
}