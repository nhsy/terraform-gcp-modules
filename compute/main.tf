resource "google_compute_instance" "this" {
  name = "${var.name}"

  machine_type = "${var.machine_type}"
  zone         = "${data.google_compute_zones.available.names[count.index]}"

  boot_disk {
    initialize_params {
      image = "${var.image}"
    }
  }

  network_interface {
    network = "${var.network}"

    access_config {
      // REQUIRED TO ALLOW SSH
    }
  }

  metadata_startup_script = "${data.template_file.startup-script.rendered}"

  service_account {
    email = "${google_service_account.this.email}"

    scopes = "${var.scopes}"
  }

  tags = [
    "remote-mgmt",
  ]

  depends_on = ["google_service_account.this"]
}

resource "google_compute_firewall" "this" {
  name        = "remote-mgmt"
  network     = "${data.google_compute_network.this.self_link}"
  description = "Allow inbound SSH"
  direction   = "INGRESS"

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = "${var.source_cidr}"
  target_tags   = ["remote-mgmt"]
}
