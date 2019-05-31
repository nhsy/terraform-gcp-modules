output "subnet_uris" {
  description = "self-link/uri for any subnetworks created by this module."
  value       = ["${concat(google_compute_subnetwork.standard.*.self_link, google_compute_subnetwork.gke.*.self_link)}"]
}

output "router_uri" {
  description = "self-link/uri for the router created by this module"
  value       = "${google_compute_router.router.self_link}"
}
