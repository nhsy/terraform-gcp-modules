###
# Shared VPC setup
###

resource "google_compute_shared_vpc_host_project" "host" {
  project = "${var.host_project_id}"
}

resource "google_compute_shared_vpc_service_project" "service_project" {
  count           = "${length(var.service_project_ids)}"
  host_project    = "${var.host_project_id}"
  service_project = "${element(var.service_project_ids, count.index)}"
  #labels          = "${var.tags}"
  depends_on = ["google_compute_shared_vpc_host_project.host"]
}

###
# Network and Subnetworks
###
resource "google_compute_network" "shared_network" {
  name                    = "${var.shared_vpc_name}"
  auto_create_subnetworks = "false"
  routing_mode            = "REGIONAL"
  project                 = "${var.host_project_id}"
}
resource "google_compute_subnetwork" "standard" {
  count            = "${length(var.standard_network_subnets)}"
  name             = "${lookup(var.standard_network_subnets[count.index], "name")}"
  ip_cidr_range    = "${lookup(var.standard_network_subnets[count.index], "cidr")}"
  region           = "${var.region}"
  project          = "${var.host_project_id}"
  network          = "${google_compute_network.shared_network.name}"
  enable_flow_logs = "${var.enable_flow_logs}"
  #labels           = "${var.tags}"
  depends_on       = ["google_compute_network.shared_network"]
}

resource "google_compute_subnetwork" "gke" {
  count            = "${length(var.gke_network_subnets)}"
  name             = "${lookup(var.gke_network_subnets[count.index], "name")}"
  ip_cidr_range    = "${lookup(var.gke_network_subnets[count.index], "cidr")}"
  region           = "${var.region}"
  project          = "${var.host_project_id}"
  network          = "${google_compute_network.shared_network.name}"
  enable_flow_logs = "${var.enable_flow_logs}"
  #labels           = "${var.tags}"
  depends_on       = ["google_compute_network.shared_network"]

  # Kubernetes Secondary Networking
  secondary_ip_range {
    range_name    = "${var.gke_pod_network_name}"
    ip_cidr_range = "${lookup(var.gke_network_subnets[count.index], "pod_cidr")}"
  }

  secondary_ip_range {
    range_name    = "${var.gke_service_network_name}"
    ip_cidr_range = "${lookup(var.gke_network_subnets[count.index], "service_cidr")}"
  }
}

###
# Additional Networking Resources
###

resource "google_compute_router" "router" {
  name    = "${var.router_name}"
  network = "${google_compute_network.shared_network.self_link}"
  project = "${var.host_project_id}"
  region  = "${var.region}"
}
resource "google_compute_router_nat" "simple-nat" {
  count                              = "${var.create_nat_gateway ? 1 : 0}"
  name                               = "${var.router_nat_name}"
  project = "${var.host_project_id}"
  router                             = "${google_compute_router.router.name}"
  region                             = "${var.region}"
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
}