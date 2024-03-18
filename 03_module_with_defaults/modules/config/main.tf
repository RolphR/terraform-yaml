locals {
  name                     = var.config.name
  some_number              = lookup(var.config, "some_number", 0)
  nested                   = var.config.nested
  configured_feature_flags = { for k, v in var.config.feature_flags : upper(k) => v if v != null }
  feature_flags = merge(local.configured_feature_flags, [
    local.some_number == 0 ? { "ZERO" : true } : { "NOT_ZERO" : true },
    { "ODD" : local.some_number % 2 == 1 },
    local.some_number == 42 ? { "ANSWER" : true } : {},
  ]...)
}
