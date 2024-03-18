locals {
  config_dir = "${path.module}/config"
}

module "config" {
  for_each = fileset(local.config_dir, "*.yml")
  source   = "./modules/config"
  config   = yamldecode(file("${local.config_dir}/${each.value}"))
  filename = each.value
}
