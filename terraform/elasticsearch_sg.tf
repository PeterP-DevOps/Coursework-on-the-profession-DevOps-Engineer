resource "yandex_vpc_security_group" "elasticsearch_sg" {
  name       = "elasticsearch-sg"
  network_id = yandex_vpc_network.main.id

  ingress {
    protocol       = "TCP"
    port           = 9200
    v4_cidr_blocks = ["10.0.0.0/16"]
  }

  ingress {
    protocol       = "TCP"
    port           = 9300
    v4_cidr_blocks = ["10.0.0.0/16"]
  }

  ingress {
    protocol       = "TCP"
    port           = 22
    v4_cidr_blocks = ["10.0.0.0/16"]
  }

  egress {
    protocol       = "ANY"
    v4_cidr_blocks = ["0.0.0.0/0"]
  }
}
