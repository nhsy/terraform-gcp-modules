# create compute service account for kubernetes cluster
resource "google_service_account" "cluster" {
  account_id   = "${var.cluster_service_account}"
  display_name = "${var.cluster_service_account} service account"
  project      = "${var.cluster_project_id}"
}

# # assign default service agent permission in service project
# resource "google_project_iam_member" "cluster_serviceAgent" {
#   project = "${var.cluster_project_id}"
#   role    = "roles/container.serviceAgent"
#   member  = "${format("serviceAccount:%s", google_service_account.cluster.email)}"
# }

# refer to https://cloud.google.com/kubernetes-engine/docs/how-to/cluster-shared-vpc
resource "google_project_iam_member" "cluster_hostServiceAgentUser" {
  project = "${var.sharedvpc_project_id}"
  role    = "roles/container.hostServiceAgentUser"
  member  = "${format("serviceAccount:service-%s@container-engine-robot.iam.gserviceaccount.com", data.google_project.cluster.number)}"
}

# grant access to subnetwork with networkUser permissions to cluster service account in shared-vpc
resource "google_compute_subnetwork_iam_member" "cluster_networkUser_1" {
  provider   = "google-beta"
  subnetwork = "${data.google_compute_subnetwork.cluster.name}"
  role       = "roles/compute.networkUser"
  member     = "${format("serviceAccount:%s@cloudservices.gserviceaccount.com", data.google_project.cluster.number)}"
}

resource "google_compute_subnetwork_iam_member" "cluster_networkUser_2" {
  provider   = "google-beta"
  subnetwork = "${data.google_compute_subnetwork.cluster.name}"
  role       = "roles/compute.networkUser"
  member     = "${format("serviceAccount:service-%s@container-engine-robot.iam.gserviceaccount.com", data.google_project.cluster.number)}"
}
