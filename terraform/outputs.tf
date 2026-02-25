output "bastion_public_ip" {
  value = yandex_compute_instance.bastion.network_interface[0].nat_ip_address
}

output "kibana_public_ip" {
  value = yandex_compute_instance.kibana.network_interface[0].nat_ip_address
}

output "elasticsearch_private_ip" {
  value = yandex_compute_instance.elasticsearch.network_interface[0].ip_address
}
