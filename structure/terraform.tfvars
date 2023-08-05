zone = "ru-central1-a"
ssh_key_path = "~/.ssh/terraform_svc_vm_rsa"

vpc-network = { 
  network_name = "ddbon-prod-network" 
  sub_networks = [{
    name        = "ddbon-prod-sub-network"
    description = "sub-network for vm"
    zone        = "ru-central1-a"
    cidr_blocks = ["10.3.0.0/24"]
  }]
}

## Labels
labels = {
  team        = "ddbon"
  environment = "production-ddbon"
}

## SA 
service-account = {
  vm = { 
    name = "vm-ddbon-sa"
	description = "service account for vm" 
  }
}


## VM VPN
vpn-vm = {
  name = "vpn-vm"
  description = "vpn vm"
  
  #fqdn -> <hostname>.<region_id>.internal
  hostname = "vpn"
  ip_address = "10.3.0.5"
  resources = {
    cores = 2
	memory = 0.5
	fraction = 5
    gpus = 0
  }
  nat = true
  nat_ip_address = "158.160.59.78"
  boot_disk = {
    disk_id = null
    initialize_params = {
      snapshot_id = null
      image_id = "fd89boblh6d5vruo39lm"
      #image_id = null
      name = "vpn-vm-system"
      description = "vpn vm boot disk"
      size = 30
      type = "network-hdd"
    }
  }
}

## VM VPN
test-vm = {
  name = "test-vm"
  description = "test vm"
  
  #fqdn -> <hostname>.<region_id>.internal
  hostname = "test"
  ip_address = "10.3.0.6"
  resources = {
    cores = 2
	memory = 8
	fraction = 20
    gpus = 0
  }
  nat = true
  boot_disk = {
    disk_id = null
    initialize_params = {
      snapshot_id = null
      image_id = "fd8bkgba66kkf9eenpkb"
      #image_id = null
      name = "test-vm-system"
      description = "vpn vm boot disk"
      size = 45
      type = "network-hdd"
    }
  }
}


## Registry
container-registry = {
	name = "registry-production-ddbon"
}