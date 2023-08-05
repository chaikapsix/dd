variable "zone" {
  description = "Region zone"
  type = string
}

variable "vpc-network" {
  description = "Configuration of vpc network"
  type        = object({
    network_name = string
    sub_networks = list(object({
      name = string
      description = string
      cidr_blocks = list(string)
      zone = string
    }))
  })
}

variable "labels" {
  description = "Labels"
  type = object({
    team = string
    environment = string
  })
}

variable "ssh_key_path" {
  description = "path ssh key to execute remote scripts"
  type = string
}

variable "vpn-vm" {
  description = "vpn vm"
  type = object({
      name = string
      description = string
      hostname = string
      ip_address = string
      resources = object({
        cores = number
	      memory = number
	      fraction = number
        gpus = number
      })
      nat = bool
      nat_ip_address = string
      boot_disk = object({
        disk_id = string
        initialize_params = object({
          snapshot_id = string
          image_id = string
          name = string
          description =string
          size = number
          type = string
        })
      })
  })
}

variable "test-vm" {
  description = "test vm"
  type = object({
      name = string
      description = string
      hostname = string
      ip_address = string
      resources = object({
        cores = number
	      memory = number
	      fraction = number
        gpus = number
      })
      nat = bool
      boot_disk = object({
        disk_id = string
        initialize_params = object({
          snapshot_id = string
          image_id = string
          name = string
          description =string
          size = number
          type = string
        })
      })
  })
}

variable "service-account" {
  description = "Configuration of service accounts network"
  type        = object({
    vm = object({
      name = string
      description = string
    })
  })
}

variable "container-registry" {
  description = "Configuration of container registry"
  type        = object({
    name = string
  })
}