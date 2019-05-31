module gke {
  source = "../../"

  region               = "${var.region}"
  sharedvpc_project_id = "${var.sharedvpc_project_id}"
  sharedvpc_network    = "${var.sharedvpc_network}"

  cluster_project_id              = "${var.cluster_project_id}"
  cluster_subnetwork              = "${var.cluster_subnetwork}"
  cluster_service_account         = "${var.cluster_service_account}"
  cluster_name                    = "${var.cluster_name}"
  cluster_pool_name               = "${var.cluster_pool_name}"
  cluster_master_cidr             = "${var.cluster_master_cidr}"
  cluster_master_authorized_cidrs = "${var.cluster_master_authorized_cidrs}"
}
