data "github_organization_teams" "all" {
  summary_only = true
}
data "github_user" "example" {
  username = "example"
}

locals {
  team_ids_by_slug = { for t in data.github_organization_teams.all.teams : (t.slug) => t.id }
}
