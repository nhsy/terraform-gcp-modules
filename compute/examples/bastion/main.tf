module bastion {
  source = "../../"

  region = "${var.region}"

  #project_id      = "${var.project_id}"
  image                   = "${data.google_compute_image.debian9.self_link}"
  name                    = "${var.name}"
  machine_type            = "${var.machine_type}"
  metadata_startup_script = "${var.metadata_startup_script}"
  service_account         = "${var.service_account}"
  network                 = "${var.network}"
  scopes                  = "${var.scopes}"
  source_cidr             = "${var.source_cidr}"
}
