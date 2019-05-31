variable "region" {
  type = "string"
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

variable "cluster_master_cidr" {
  type = "string"
}

variable "cluster_subnetwork" {
  description = "The subnetwork to host the cluster in"
}

variable "cluster_service_account" {
  description = "Service account to associate to the nodes in the cluster"
}

variable "cluster_master_authorized_cidrs" {
  type = "list"
}
