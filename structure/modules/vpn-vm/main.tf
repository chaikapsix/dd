
terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
      version = "0.63.0"
    }
  }
}

# Create vpn vm
resource "yandex_compute_instance" "vm" {
  name        = var.vm.name
  
  # standard-v2 Intel Cascade Lake
  platform_id = "standard-v2" 
  zone        = var.zone

  hostname    = var.vm.hostname
  allow_stopping_for_update = true

  resources {
    cores  = var.vm.resources.cores
    memory = var.vm.resources.memory
    core_fraction = var.vm.resources.fraction
    gpus = var.vm.resources.gpus
  }

  scheduling_policy {
      preemptible = false
  }

  boot_disk {
    auto_delete = true
    device_name = var.vm.boot_disk.initialize_params.name
    disk_id = var.vm.boot_disk.disk_id
    initialize_params {
      snapshot_id = var.vm.boot_disk.initialize_params.snapshot_id
      image_id = var.vm.boot_disk.initialize_params.image_id
      name = var.vm.boot_disk.initialize_params.name
      description = var.vm.boot_disk.initialize_params.description
      size = var.vm.boot_disk.initialize_params.size
      type = var.vm.boot_disk.initialize_params.type
    }
  }
  
  network_interface {
    subnet_id = var.vm-network
    nat = var.vm.nat
    ip_address = var.vm.ip_address
    nat_ip_address = var.vm.nat_ip_address
  }

  metadata = {
    user-data = var.metadata.user-data
  }

}