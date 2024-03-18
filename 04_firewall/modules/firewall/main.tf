locals {
  ingress = {
    for rule in var.ingress :
    rule.name => {
      priority = rule.priority
      action = lookup({
        allow = "allow",
        deny  = "deny",
      }, lower(rule.action))
      source      = rule.source
      destination = rule.destination
      protocols   = rule.protocols
    }
  }

  egress = {
    for rule in var.egress :
    rule.name => {
      priority = rule.priority
      action = lookup({
        allow = "allow",
        deny  = "deny",
      }, lower(rule.action))
      source      = rule.source
      destination = rule.destination
      protocols   = rule.protocols
    }
  }

  errors = {
    ingress = flatten([
      [
        for name, rule in local.ingress :
        "[${name}]: Invalid source range '${rule.source}'" if !startswith(rule.source, "${cidrhost(rule.source, 0)}/")
      ],
      [
        for name, rule in local.ingress :
        "[${name}]: Invalid destination range '${rule.destination}'" if !startswith(rule.destination, "${cidrhost(rule.destination, 0)}/")
      ],
    ])
    egress = flatten([
      [
        for name, rule in local.egress :
        "[${name}]: Invalid source range '${rule.source}'" if !startswith(rule.source, "${cidrhost(rule.source, 0)}/")
      ],
      [
        for name, rule in local.egress :
        "[${name}]: Invalid destination range '${rule.destination}'" if !startswith(rule.destination, "${cidrhost(rule.destination, 0)}/")
      ],
    ])
  }
}
