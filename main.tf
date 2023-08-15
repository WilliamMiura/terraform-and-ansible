provider "google" {
  credentials = file("iamkey.json")
  project     = var.project
  region      = var.region
}

/*provider "aws" {
  region = "us-east-1"
  access_key = var.accesskeypem_aws
  secret_key = var.accesskey_aws
}*/

resource "google_compute_project_metadata_item" "ssh-keys" {
  key   = "ssh-keys"
  value = "willianmiurass:${file("${"~/.ssh/id_rsa.pub"}")}"
}


resource "google_compute_firewall" "allow-ingress" {
  name    = "allow-ingress"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["22", "6443", "80", "8080", "443"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags = ["k8s"]
}

resource "google_compute_instance" "k8s_instance_workers" {
  count        = 2
  name         = "k8s-worker${count.index + 1}"
  machine_type = "e2-medium"
  zone         = var.zone
  tags = ["k8s-worker", "k8s"]
  labels = {
    worker = "k8s-worker",
    k8s = "all"
  }

  boot_disk {
    initialize_params {
      image = "ubuntu-2004-lts"
    }
  }

  network_interface {
    network = "default"
    access_config {
      // Especifica que o IP público seja atribuído às instâncias
    }
  }
}

resource "google_compute_instance" "k8s_instance_master" {
  count        = 1
  name         = "k8s-master"
  machine_type = "e2-medium"
  zone         = var.zone
  tags = ["k8s-master", "k8s"]
  labels = {
    master = "k8s-master",
    k8s = "all"
  }

  boot_disk {
    initialize_params {
      image = "ubuntu-2004-lts"
    }
  }

  network_interface {
    network = "default"
    access_config {
      // Especifica que o IP público seja atribuído às instâncias
    }
  }

}

