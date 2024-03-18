variable "config" {
  type = object({
    name        = string
    some_number = optional(number, 42)
    nested = object({
      key   = string
      value = number
    })
    feature_flags = map(bool)
  })
}

variable "filename" {
  type = string
}
