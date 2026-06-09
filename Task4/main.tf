terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = ">= 0.100"
    }
  }
  required_version = ">= 1.0"
}

provider "yandex" {
  zone      = var.zone
  folder_id = var.folder_id
  # Токен можно передать через переменную окружения YC_TOKEN
}

data "yandex_compute_image" "ubuntu" {
  family = var.image_family
}

resource "yandex_compute_disk" "testvm" {
  name     = var.disk_name
  type     = var.disk_type
  zone     = var.zone
  image_id = data.yandex_compute_image.ubuntu.image_id
  size     = var.disk_size
}

resource "yandex_vpc_network" "testnet" {
  name = var.network_name
}

resource "yandex_vpc_subnet" "testsubnet" {
  name           = var.subnet_name
  zone           = var.zone
  network_id     = yandex_vpc_network.testnet.id
  v4_cidr_blocks = ["192.168.10.0/24"]
}

resource "yandex_compute_instance" "testvm" {
  name = var.instance_name

  resources {
    cores  = var.cores
    memory = var.ram
  }

  boot_disk {
    disk_id = coalesce(var.disk_id, yandex_compute_disk.testvm.id)
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.testsubnet.id
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file(var.public_key)}"
  }
}
