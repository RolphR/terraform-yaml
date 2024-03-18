locals {
  config_dir = "${path.module}/config"
}

resource "terraform_data" "config" {
  for_each = fileset(local.config_dir, "*.yml")
  input    = yamldecode(file("${local.config_dir}/${each.value}"))
}
