data "github_organization_teams" "all" {
  summary_only = true
}

data "github_user" "user" {
  for_each = toset(length(var.environments) > 0 ? distinct(concat([ for n, e in var.environments : e.reviewer_users ]...)) : [])
  username = each.key
}

locals {
  team_ids_by_slug = { for t in data.github_organization_teams.all.teams : (t.slug) => t.id }
  user_ids_by_name = { for u in data.github_user.user : (u.username) => u.id }
}
