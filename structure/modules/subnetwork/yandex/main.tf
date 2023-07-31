terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
      version = "0.63.0"
    }
  }
}

resource "yandex_vpc_subnet" "subnet" {
  count = length(var.sub_networks)
  name           = var.sub_networks[count.index].name
  v4_cidr_blocks = var.sub_networks[count.index].cidr_blocks
  zone           = var.sub_networks[count.index].zone
  network_id     = var.network_id
}