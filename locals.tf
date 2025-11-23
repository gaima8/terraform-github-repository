locals {
  rulesets_by_name = {
    for rs in var.rulesets : rs.name => rs
  }
}
