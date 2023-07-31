terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
      version = "0.63.0"
    }
  }
}

resource "yandex_iam_service_account" "sa" {
  name        = var.sa_name
  description = var.sa_description
}