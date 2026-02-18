resource "yandex_compute_instance" "prometheus" {
  name        = "prometheus"
  zone        = "ru-central1-a"
  platform_id = "standard-v3"

  resources {
    cores  = 2
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.id
      size     = 20
    }
  }

  network_interface {
    subnet_id          = yandex_vpc_subnet.private_a.id
    security_group_ids = [yandex_vpc_security_group.prometheus_sg.id]
    nat                = false
  }

  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/id_ed25519.pub")}"
  }
}

resource "yandex_vpc_security_group" "prometheus_sg" {
  name       = "prometheus-sg"
  network_id = yandex_vpc_network.main.id

  ingress {
    protocol          = "TCP"
    port              = 22
    predefined_target = "self_security_group"
  }

  ingress {
    protocol       = "TCP"
    port           = 9090
    v4_cidr_blocks = ["10.0.0.0/16"]
  }

  egress {
    protocol       = "ANY"
    v4_cidr_blocks = ["0.0.0.0/0"]
  }
}
