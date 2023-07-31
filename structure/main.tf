terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
      version = "0.63.0"
    }
  }
}

# Create service accounts
# SA K8S
module "service-account-vm" {
  source = "./modules/sa/yandex"
  sa_name         = var.service-account.vm.name
  sa_description  = var.service-account.vm.description
}

# Configure the Yandex.Cloud provider
provider "yandex" {
  service_account_key_file = "./key.json"
  cloud_id                 = "b1gcqgn2cf92sc9scdjl"
  folder_id                = "b1gvrj48aha91duiqpps"
  zone                     = var.zone
}

# Create vpc networks
module "vpc-network"{
  source = "./modules/network/yandex"

  network_name = var.vpc-network.network_name
}

module "vpc-subnetwork"{
  source = "./modules/subnetwork/yandex"
   
  network_id   = module.vpc-network.id
  sub_networks = var.vpc-network.sub_networks
 
}


# Create vpn-vm
module "vpn-vm" {
  source = "./modules/vpn-vm"

  vm               = var.vpn-vm
  labels           = var.labels
  metadata = {
    user-data      = "${file("metadata/vm-metadata")}"
  }
  zone             = var.zone
  vm-network       = module.vpc-subnetwork.sub_networks[0].id
}

# Create container registry
module "container-registry"{
  source  = "./modules/container-registry/yandex"

  name    = var.container-registry.name
}