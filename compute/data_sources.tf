data "template_file" "startup-script" {
  template = "${file(var.metadata_startup_script)}"
}

data "google_client_config" "this" {}

data "google_compute_network" "this" {
  name    = "${var.network}"
  project = "${local.project_id}"
}

data "google_compute_zones" "available" {
  region = "${var.region}"
}
