locals {
  config_dir = "${path.module}/config"
}

module "firewall" {
  source  = "./modules/firewall"
  ingress = yamldecode(file("${local.config_dir}/ingress.yml"))
  egress  = yamldecode(file("${local.config_dir}/egress.yml"))
}
