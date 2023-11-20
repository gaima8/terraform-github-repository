resource "github_actions_variable" "this" {
  for_each      = var.variables
  repository    = github_repository.repository.name
  variable_name = each.key
  value         = each.value
}
