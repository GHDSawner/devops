resource "random_id" "instance_id" {
  byte_length = 8
}

resource "google_compute_instance" "default" {
  name         = "jenkinsvm-${random_id.instance_id.hex}"
  machine_type = "g1-small"
  zone         = "us-east1-c"

  boot_disk {
    initialize_params {
      image = "bitnami-jenkins-1-638-1-linux-debian-7-x86-64"
    }
  }

}
