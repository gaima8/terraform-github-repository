resource "github_repository_ruleset" "ruleset" {
  for_each = local.rulesets_by_name

  name        = each.value.name
  enforcement = each.value.enforcement
  target      = each.value.target
  repository  = github_repository.repository.name

  dynamic "bypass_actors" {
    for_each = each.value.bypass_actors != null ? each.value.bypass_actors : []
    content {
      actor_id    = bypass_actors.value.actor_id
      actor_type  = bypass_actors.value.actor_type
      bypass_mode = lookup(bypass_actors.value, "bypass_mode", null)
    }
  }

  dynamic "conditions" {
    for_each = each.value.conditions != null ? [each.value.conditions] : []
    content {
      ref_name {
        include = conditions.value.ref_name.include
        exclude = conditions.value.ref_name.exclude
      }
    }
  }

  # Each "rules" entry inside the list
  dynamic "rules" {
    for_each = each.value.rules
    content {
      creation                      = lookup(rules.value, "creation", null)
      deletion                      = lookup(rules.value, "deletion", null)
      non_fast_forward              = lookup(rules.value, "non_fast_forward", null)
      required_signatures           = lookup(rules.value, "required_signatures", null)
      required_linear_history       = lookup(rules.value, "required_linear_history", null)
      update                        = lookup(rules.value, "update", null)
      update_allows_fetch_and_merge = lookup(rules.value, "update_allows_fetch_and_merge", null)

      dynamic "pull_request" {
        for_each = rules.value.pull_request != null ? [rules.value.pull_request] : []
        content {
          require_code_owner_review         = lookup(pull_request.value, "require_code_owner_review", null)
          required_approving_review_count   = lookup(pull_request.value, "required_approving_review_count", null)
          required_review_thread_resolution = lookup(pull_request.value, "required_review_thread_resolution", null)
        }
      }
    }
  }
}
