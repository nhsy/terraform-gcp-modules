variable "region" {
  type = "string"
  description = "The region to host the cluster in"
  default = "europe-west2"
}

variable "sharedvpc_project_id" {
  type = "string"
}

variable "sharedvpc_network" {
  type = "string"
}

variable "cluster_project_id" {
  description = "The project ID to host the cluster in"
}

variable "cluster_name" {
  description = "The cluster name"
}

variable "cluster_pool_name" {
  description = "The cluster pool name"
}

variable "cluster_machine_type" {
  type = "string"
  default = "n1-standard-2"
}

variable "cluster_master_cidr" {
  type = "string"
}

variable "cluster_subnetwork" {
  description = "The subnetwork to host the cluster in"
}

variable "cluster_service_account" {
  description = "Service account to associate to the nodes in the cluster"
}

variable "cluster_min_master_version" {
  type = "string"
  default = "latest"
}

variable "cluster_autoscaling_min_nodes" {
  type = "string"
  default ="1"
}

variable "cluster_autoscaling_max_nodes" {
  type = "string"
  default = "3"
}

variable "cluster_master_authorized_cidrs" {
  type = "list"
}

variable "cluster_daily_maintenance_start" {
  type = "string"
  default = "02:00"
}

variable "cluster_node_disk_size" {
  type = "string"
  default = "10"
}

variable "cluster_oauth_scopes" {
  type = "list"
  default = [
      "compute-rw",
      "storage-ro",
      "logging-write",
      "monitoring",
      "https://www.googleapis.com/auth/userinfo.email",
    ]
}