resource "yandex_vpc_address" "bastion_static_ip" {
  name = "bastion-static-ip"

  external_ipv4_address {
    zone_id = "ru-central1-a"
  }
}

