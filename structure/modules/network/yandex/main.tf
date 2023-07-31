terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
      version = "0.63.0"
    }
  }
}

resource "yandex_vpc_network" "network" {
  name = var.network_name
}