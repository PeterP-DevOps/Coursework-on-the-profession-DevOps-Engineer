resource "yandex_compute_instance" "elasticsearch" {
  name = "elasticsearch"
  zone = "ru-central1-a"

  resources {
    cores = 2
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.id
      size     = 50
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.private_a.id
    security_group_ids = [yandex_vpc_security_group.elasticsearch_sg.id]
  }

  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/id_ed25519.pub")}"
  }
}
