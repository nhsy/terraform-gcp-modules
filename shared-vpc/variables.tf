variable "region" {
  default     = "europe-west2"
  type        = "string"
  description = "region name"
}

variable "region_zone" {
  default = "europe-west2-a"
  type    = "string"
  default = "zone name in the region provided."
}

variable "host_project_id" {
  type        = "string"
  default     = "shared-vpc"
  description = "Identifier for the host project to be used"
}

variable "service_project_ids" {
  type        = "list"
  default     = []
  description = "Associated service projects to link with the host project."
}

variable shared_vpc_name {
  type        = "string"
  default     = "shared-network"
  description = "Name for the shared vpc network"
}

variable "gke_pod_network_name" {
  type        = "string"
  default     = "vpc-gke-pod-network"
  description = "Name for the gke pod network"
}

variable "gke_service_network_name" {
  type        = "string"
  default     = "vpc-gke-service-network"
  description = "Name for the gke service network"
}

variable standard_network_subnets {
  type        = "list"
  default     = []
  description = "cidr ranges for standard (non-gke) subnetworks"
}

variable gke_network_subnets {
  type        = "list"
  default     = []
  description = "cidr ranges for gke subnetworks"
}

variable router_nat_name {
  type        = "string"
  default     = "vpc-network-nat-gateway"
  description = "Name for the router NAT gateway"
}

variable router_name {
  type        = "string"
  default     = "vpc-network-router"
  description = "router name"
}

variable enable_flow_logs {
  type        = "string"
  default     = "false"
  description = "Boolean value to determine whether to enable flowlogs in subnet creation"
}

variable create_nat_gateway {
  type        = "string"
  default     = "true"
  description = "Boolean value to determine whether to create a NAT gateway"
}

variable tags {
  type        = "map"
  default     = {}
  description = "A map of tags to add to all resources"
}
