variable "ingress" {
  type = list(object({
    name        = string
    priority    = optional(number, 1000)
    action      = string
    source      = string
    destination = string
    protocols = list(object({
      protocol = string
      ports    = optional(list(string))
    }))
  }))
}

variable "egress" {
  type = list(object({
    name        = string
    priority    = optional(number, 1000)
    action      = string
    source      = string
    destination = string
    protocols = list(object({
      protocol = string
      ports    = optional(list(string))
    }))
  }))
}
