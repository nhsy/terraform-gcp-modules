terraform {
  required_version = "~> 0.11.12"
}

provider "google" {
  version = "2.1"
  project = "${var.cluster_project_id}"
  region  = "${var.region}"
}

# separate provider needed for creation of firewall rules in sharedvpc project
provider "google" {
  alias   = "shared-vpc"
  version = "2.1"
  project = "${var.sharedvpc_project_id}"
  region  = "${var.region}"
}

# separate google-beta provider needed to assign sharedvpc networkUser permissions
provider "google-beta" {
  version = "2.1"
  project = "${var.sharedvpc_project_id}"
  region  = "${var.region}"
}
