# create compute service account for compute instance
resource "google_service_account" "this" {
  account_id   = "${var.service_account}"
  display_name = "${var.service_account} service account"
  project      = "${local.project_id}"
}

# assign default service agent permission in service project
resource "google_project_iam_member" "this" {
  project = "${local.project_id}"
  role    = "roles/compute.serviceAgent"
  member  = "${format("serviceAccount:%s", google_service_account.this.email)}"
}
