resource "yandex_vpc_security_group" "internal_ssh" {
  name       = "internal-ssh"
  network_id = yandex_vpc_network.main.id

  ingress {
    protocol          = "TCP"
    port              = 22
    security_group_id = yandex_vpc_security_group.bastion.id
  }
}
