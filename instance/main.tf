resource "google_compute_address" "static" {
  name = "ipv4-address"
}

resource "google_compute_instance" "connect-instance" {
  name         = "instance-t-connect-private-instance"
  machine_type = "n1-standard-8"
  zone         = "europe-north1-b"
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      labels = {
        my_label = "value"
      }
    }
  }

  # Local SSD disk
  scratch_disk {
    interface = "SCSI"
  }

  network_interface {
    network    = var.network
    subnetwork = var.subnetwork

    access_config {
      nat_ip = google_compute_address.static.address
    }

  }

  metadata = {
    foo = "bar"
  }

  metadata_startup_script = "echo hi > /test.txt"
  
  depends_on = [var.ins_depends_on]
}


