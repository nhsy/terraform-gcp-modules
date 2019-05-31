data "google_project" "host_project" {
  project_id = "${var.host_project_id}"
}

data "google_project" "service_projects" {
  count      = "${length(var.service_project_ids)}"
  project_id = "${element(var.service_project_ids, count.index)}"
}

# data "google_compute_network" "shared-vpc" {
#   name     = "${var.sharedvpc_network}"
#   project  = "${var.sharedvpc_project_id}"
# }


# data "google_compute_subnetwork" "cluster" {
#   name     = "${var.cluster_subnetwork}"
#   project  = "${var.sharedvpc_project_id}"
#   region   = "${var.region}"
# }

