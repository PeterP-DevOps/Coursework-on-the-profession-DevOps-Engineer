terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "~> 0.100"
    }
  }
}

provider "yandex" {
  service_account_key_file = "/home/ppg/yc-sa-key.json"
  cloud_id  = "organization-nphne-gee3z7gc"
  folder_id = "b1gacfkkbht69o3ihovj"
  zone      = "ru-central1-a"
}
