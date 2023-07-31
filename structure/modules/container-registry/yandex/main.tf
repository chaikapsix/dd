terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
      version = "0.63.0"
    }
  }
}

resource "yandex_container_registry" "registry" {
  name    = var.name

  # provisioner "local-exec" {
  #   command = "yc container registry configure-docker"
  # }
}