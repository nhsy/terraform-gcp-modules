resource "google_container_cluster" "gke" {
  name   = "${var.cluster_name}"
  region = "${var.region}"

  # We can't create a cluster with no node pool defined, but we want to only use
  # separately managed node pools. So we create the smallest possible default
  # node pool and immediately delete it.
  remove_default_node_pool = true

  initial_node_count = 1

  maintenance_policy {
    daily_maintenance_window {
      start_time = "${var.cluster_daily_maintenance_start}"
    }
  }

  # Setting an empty username and password explicitly disables basic auth
  master_auth {
    username = ""
    password = ""

    client_certificate_config {
      issue_client_certificate = false
    }
  }

  # use latest version, unless a specific version requested
  min_master_version = "${var.cluster_min_master_version == "latest" ? data.google_container_engine_versions.this.latest_node_version : var.cluster_min_master_version}"

  # specifying node_config here causes terraform to re-create the cluster on EVERY execution

  master_authorized_networks_config = {
    cidr_blocks = "${var.cluster_master_authorized_cidrs}"
  }
  network    = "${data.google_compute_network.shared-vpc.self_link}"
  subnetwork = "${data.google_compute_subnetwork.cluster.self_link}"
  # ensure secondary networks are created in the order pod network, then services network
  ip_allocation_policy = {
    cluster_secondary_range_name  = "${data.google_compute_subnetwork.cluster.secondary_ip_range.0.range_name}"
    services_secondary_range_name = "${data.google_compute_subnetwork.cluster.secondary_ip_range.1.range_name}"
  }
  private_cluster_config = {
    enable_private_endpoint = "true"
    enable_private_nodes    = "true"
    master_ipv4_cidr_block  = "${var.cluster_master_cidr}"
  }
  # ensure service accounts are created before cluster creation
  depends_on = [
    "google_service_account.cluster",

    # "google_project_iam_member.cluster_serviceAgent",
    "google_project_iam_member.cluster_hostServiceAgentUser",

    "google_compute_subnetwork_iam_member.cluster_networkUser_1",
    "google_compute_subnetwork_iam_member.cluster_networkUser_2",
  ]
}

resource "google_container_node_pool" "gke_node_pool" {
  name   = "${var.cluster_pool_name}"
  region = "${var.region}"

  node_count = 1
  cluster    = "${google_container_cluster.gke.name}"

  autoscaling {
    min_node_count = "${var.cluster_autoscaling_min_nodes}"
    max_node_count = "${var.cluster_autoscaling_max_nodes}"
  }

  node_config {
    disk_size_gb    = "${var.cluster_node_disk_size}"
    machine_type    = "${var.cluster_machine_type}"
    oauth_scopes    = "${var.cluster_oauth_scopes}"
    service_account = "${google_service_account.cluster.email}"
    tags            = ["gke-private", "${data.google_compute_subnetwork.cluster.name}"]
  }
}
