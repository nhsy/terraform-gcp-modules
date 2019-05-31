provider "google" {
  version = "2.1"

  region = "${var.region}"
  zone   = "${var.region_zone}"
}
