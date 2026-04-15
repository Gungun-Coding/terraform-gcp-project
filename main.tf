provider "google" {
    project = "numeric-citron-484418-i4"
    region = "asia-south1"
  
}



resource "google_compute_instance" "my_instance" {
    name = "instance-1"
    machine_type = "e2-medium"
    zone = "asia-south1-a"
    
    boot_disk {
        initialize_params {
            image = "debian-cloud/debian-11"

        }
    }

    network_interface {
      access_config{}
    }
}

terraform {
    backend "gcs" {
        bucket = "tf-state-demo-bucket"
        prefix = "terraform/state"
    }
}
