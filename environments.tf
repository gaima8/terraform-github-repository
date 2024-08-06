variable "environments" {
  type = map(object({
    reviewer_teams = optional(list(string), [])
    reviewer_users = optional(list(string), [])
    deployment_branch_policy = optional(object({
      protected_branches     = bool
      custom_branch_policies = optional(bool)
    }))
    branch_patterns     = optional(list(string), [])
    variables           = optional(map(string), {})
    wait_timer          = optional(number)
    prevent_self_review = optional(bool)
  }))
  default = {}
}

resource "github_repository_environment" "this" {
  for_each            = var.environments
  repository          = github_repository.repository.name
  environment         = each.key
  wait_timer          = each.value.wait_timer
  prevent_self_review = each.value.prevent_self_review

  dynamic "reviewers" {
    for_each = length(each.value.reviewer_teams) > 0 || length(each.value.reviewer_users) > 0 ? [true] : []
    content {
      teams = [for slug in each.value.reviewer_teams : try(local.team_ids_by_slug[slug], slug)]
      users = [for username in each.value.reviewer_users : local.user_ids_by_name[username]]
    }
  }

  dynamic "deployment_branch_policy" {
    for_each = each.value.deployment_branch_policy != null ? [each.value.deployment_branch_policy] : (length(each.value.branch_patterns) > 0 ? [{}] : [])
    content {
      protected_branches     = lookup(deployment_branch_policy.value, "protected_branches", false)
      custom_branch_policies = lookup(deployment_branch_policy.value, "custom_branch_policies", length(each.value.branch_patterns) > 0)
    }
  }
}

resource "github_repository_deployment_branch_policy" "this" {
  for_each = merge([for envName, env in var.environments : merge([for bp in env.branch_patterns : { ("${envName}:${bp}") : {
    environment    = envName
    branch_pattern = bp
  } }]...)]...)
  depends_on       = [github_repository_environment.this]
  environment_name = each.value.environment
  repository       = github_repository.repository.name
  name             = each.value.branch_pattern
}

resource "github_actions_environment_variable" "this" {
  for_each = merge([for envName, env in var.environments : merge([for k, v in env.variables : { ("${envName}:${k}") : {
    environment = envName
    key         = k
    value       = v
  } }]...)]...)
  depends_on    = [github_repository_environment.this]
  variable_name = each.value.key
  environment   = each.value.environment
  value         = each.value.value
  repository    = github_repository.repository.name
}
