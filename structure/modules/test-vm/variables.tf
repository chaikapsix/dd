variable "zone" {
  description = "Region zone"
  type        = string
}

variable "vm-network" {
    description = "VM sub-network id"
    type        = string
}

variable "vm" {
  description = "Configuration for service vm"
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
        description = string
        size = number
        type = string
      })
    })
  })
}

variable "labels" {
  description = "Labels"
  type = object({
    team = string
    environment = string
  })
}

variable "metadata" {
  description = "metadata"
  type        = object({
    user-data = string
  })
}