variable "region" {
  description = "The region to host the compute instance in"
}

variable "service_account" {
  type        = "string"
  description = "Service account to associate to the compute instance"
}

variable "machine_type" {
  type = "string"
}

variable "name" {
  type = "string"
}

variable "network" {
  type = "string"
}

variable "scopes" {
  type = "list"
}

variable "source_cidr" {
  type = "list"
}

variable "image" {
  type = "string"
}

variable "metadata_startup_script" {
  type = "string"
}

locals {
  project_id = "${data.google_client_config.this.project}"
}
