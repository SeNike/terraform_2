resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}


resource "yandex_vpc_subnet" "develop" {
  name           = var.vpc_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr
  #route_table_id = yandex_vpc_route_table.rt.id
}


resource "yandex_vpc_subnet" "develop_db" {
  name           = var.vpc_name_db
  zone           = var.default_zone_db
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr_db
  #route_table_id = yandex_vpc_route_table.rt.id
}

data "yandex_compute_image" "ubuntu" {
  family = var.vm_web_image
}


#first wm
resource "yandex_compute_instance" "platform" {
  name        = "netology-develop-platform-web"
  platform_id = var.vm_db_platform
  zone = var.default_zone
  allow_stopping_for_update = true
  resources {
    cores         = 2
    memory        = 2
    core_fraction = 20
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }


  metadata = {
    serial-port-enable = 1
    ssh-keys           = "ubuntu:${var.vms_ssh_root_key}"
  }
}



#second db_wm


#data "yandex_compute_image" "ubuntu_db" {
#  family = var.vm_db_image
#}


#resource "yandex_vpc_subnet" "develop_db" {
#  name           = var.vpc_name_db
#  zone           = var.default_zone_db
#  network_id     = yandex_vpc_network.develop.id
#  v4_cidr_blocks = var.default_cidr_db
  #route_table_id = yandex_vpc_route_table.rt.id
#}



resource "yandex_compute_instance" "platform_db" {
  name        = "netology-develop-platform-db"
  platform_id = var.vm_web_platform
  zone = var.default_zone_db
  allow_stopping_for_update = true
  resources {
    cores         = 2
    memory        = 2
    core_fraction = 20
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop_db.id
    nat       = true
  }


  metadata = {
    serial-port-enable = 1
    ssh-keys           = "ubuntu:${var.vms_ssh_root_key}"
  }
}
