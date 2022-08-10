output "vpc_output_name" {
  value = google_compute_network.vpc_network.id
}

output "subnetwork_output_name" {
  value = google_compute_subnetwork.sub.id
}
