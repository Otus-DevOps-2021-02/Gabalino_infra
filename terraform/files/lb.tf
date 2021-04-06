resource "yandex_lb_target_group" "target" {
  name      = "app-group"
  region_id = "ru-central1"

#  target {
#    subnet_id = var.subnet_id
#    address   = yandex_compute_instance.app[2].network_interface.0.ip_address
#  }

  target {
    subnet_id = var.subnet_id
    address   = yandex_compute_instance.app[0].network_interface.0.ip_address
  }
  target {
    subnet_id = var.subnet_id
    address   = yandex_compute_instance.app[1].network_interface.0.ip_address
  }
}

resource "yandex_lb_network_load_balancer" "app-nlb" {
  name = "reddit-app-nlb"

  listener {
    name = "app-listener"
    port = 9292
    external_address_spec {
      ip_version = "ipv4"
    }
  }

  attached_target_group {
    target_group_id = yandex_lb_target_group.target.id

    healthcheck {
      name = "http"
      http_options {
        port = 9292
        path = "/"
      }
    }
  }
}
