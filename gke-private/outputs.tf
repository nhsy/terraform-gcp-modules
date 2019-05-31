output "cluster_sa" {
  value = "${google_service_account.cluster.email}"
}

# output "cluster_sa_role" {
#   value = "${google_project_iam_member.cluster_serviceAgent.role}"
# }

# output "cluster_client_certificate" {
#   value = "${google_container_cluster.gke.master_auth.0.client_certificate}"
# }


# output "cluster_client_key" {
#   value = "${google_container_cluster.gke.master_auth.0.client_key}"
# }


# output "cluster_cluster_ca_certificate" {
#   value = "${google_container_cluster.gke.master_auth.0.cluster_ca_certificate}"
# }

