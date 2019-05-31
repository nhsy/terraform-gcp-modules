output "ip" {
  value = "${google_compute_instance.this.network_interface.0.access_config.0.nat_ip}"
}

output "sa" {
  value = "${google_service_account.this.email}"
}

output "sa_role" {
  value = "${google_project_iam_member.this.role}"
}
