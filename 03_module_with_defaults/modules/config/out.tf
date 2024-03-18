output "name" {
  value = local.name
  precondition {
    condition = alltrue([
      local.name != null,
      length(local.name) > 3,
      length(local.name) < 10,
    ])
    error_message = "Error in ${var.filename}: Invalid value for name"
  }
}

output "some_number" {
  value = local.some_number
  precondition {
    condition = alltrue([
      local.some_number >= 0,
      local.some_number < 100,
    ])
    error_message = "Error in ${var.filename}: Invalid value for some_number"
  }
}

output "nested" {
  value = local.nested
}

output "feature_flags" {
  value = local.feature_flags
}
