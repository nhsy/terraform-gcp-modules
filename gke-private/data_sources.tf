data "google_project" "shared-vpc" {
  project_id = "${var.sharedvpc_project_id}"
}

data "google_project" "cluster" {
  project_id = "${var.cluster_project_id}"
}

data "google_compute_network" "shared-vpc" {
  provider = "google.shared-vpc"
  name     = "${var.sharedvpc_network}"
  project  = "${var.sharedvpc_project_id}"
}

data "google_compute_subnetwork" "cluster" {
  provider = "google.shared-vpc"
  name     = "${var.cluster_subnetwork}"
  project  = "${var.sharedvpc_project_id}"
  region   = "${var.region}"
}

data "google_client_config" "default" {}

data "google_compute_zones" "available" {
  region = "${var.region}"
}

data "google_container_engine_versions" "this" {
  region = "${var.region}"
}