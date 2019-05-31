# Setup of shared VPC on a provided, existing project, connects services accounts and a basic gke subnet.
module "shared-vpc" {
  source = "../../"

  region      = "${var.region}"
  region_zone = "${var.region_zone}"

  host_project_id = "${var.host_project_id}"

  service_project_ids      = "${var.service_project_ids}"
  standard_network_subnets = "${var.standard_network_subnets}"

  gke_pod_network_name     = "${var.gke_pod_network_name}"
  gke_service_network_name = "${var.gke_service_network_name}"
  gke_network_subnets      = "${var.gke_network_subnets}"

  create_nat_gateway = "${var.create_nat_gateway}"

  tags = "${var.tags}"
}
