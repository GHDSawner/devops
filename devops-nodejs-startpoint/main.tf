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
//  metadata_startup_script = "sudo apt-get update && sudo apt-get install apache2 -y && echo '<!doctype html><html><body><h1>Hello from Terraform on Google Cloud!</h1></body></html>' | sudo tee /var/www/html/index.html"

  network_interface {
    network = "default"

    access_config {
      // Include this section to give the VM an external ip address
    }
  }

  // Apply the firewall rule to allow external IPs to access this instance
 // tags = ["http-server"]
}
