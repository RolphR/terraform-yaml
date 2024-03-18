output "ingress_rules" {
  value = local.ingress
  precondition {
    condition     = length(local.errors.ingress) == 0
    error_message = "Ingress rules invalid: ${join(", ", local.errors.ingress)}"
  }
}

output "egress_rules" {
  value = local.egress
  precondition {
    condition     = length(local.errors.egress) == 0
    error_message = "Egress rules invalid:\n ${join(",\n", local.errors.egress)}"
  }
}
