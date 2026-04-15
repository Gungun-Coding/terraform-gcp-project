provider "google" {
    project = numeric-citron-484418-i4
    region = us-east1
  
}



resource "google_compute_instance" "my_instance" {
    name = "instance-1"
    machine_type = "e2-medium"
    
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