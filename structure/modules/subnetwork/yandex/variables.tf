variable "network_id" {
  description = "Network identifier"
  type        = string
}

variable "sub_networks" {
  description = "Configuration of vpc sub-networks"
  type        = list(object({
    name = string
    description = string
    cidr_blocks = list(string)
    zone = string
  }))
}
