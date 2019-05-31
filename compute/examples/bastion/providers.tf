provider "google" {
  version = "2.1"
  project = "${var.project_id}"
  region  = "${var.region}"
}
