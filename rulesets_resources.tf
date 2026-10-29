locals {
  rulesets_by_name = {
    for rs in var.rulesets : rs.name => rs
  }
}

resource "github_repository_ruleset" "ruleset" {
  for_each = local.rulesets_by_name

  name        = each.value.name
  enforcement = each.value.enforcement
  target      = each.value.target
  repository  = github_repository.repository.name

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

      # -----------------------------------------------------------------------
      # Metadata Patterns
      # -----------------------------------------------------------------------

      dynamic "branch_name_pattern" {
        for_each = rules.value.branch_name_pattern != null ? [rules.value.branch_name_pattern] : []
        content {
          operator = lookup(branch_name_pattern.value, "operator", null)
          pattern  = lookup(branch_name_pattern.value, "pattern", null)
          name     = lookup(branch_name_pattern.value, "name", null)
          negate   = lookup(branch_name_pattern.value, "negate", null)
        }
      }

      dynamic "tag_name_pattern" {
        for_each = rules.value.tag_name_pattern != null ? [rules.value.tag_name_pattern] : []
        content {
          operator = lookup(tag_name_pattern.value, "operator", null)
          pattern  = lookup(tag_name_pattern.value, "pattern", null)
          name     = lookup(tag_name_pattern.value, "name", null)
          negate   = lookup(tag_name_pattern.value, "negate", null)
        }
      }

      dynamic "commit_author_email_pattern" {
        for_each = rules.value.commit_author_email_pattern != null ? [rules.value.commit_author_email_pattern] : []
        content {
          operator = lookup(commit_author_email_pattern.value, "operator", null)
          pattern  = lookup(commit_author_email_pattern.value, "pattern", null)
          name     = lookup(commit_author_email_pattern.value, "name", null)
          negate   = lookup(commit_author_email_pattern.value, "negate", null)
        }
      }

      dynamic "commit_message_pattern" {
        for_each = rules.value.commit_message_pattern != null ? [rules.value.commit_message_pattern] : []
        content {
          operator = lookup(commit_message_pattern.value, "operator", null)
          pattern  = lookup(commit_message_pattern.value, "pattern", null)
          name     = lookup(commit_message_pattern.value, "name", null)
          negate   = lookup(commit_message_pattern.value, "negate", null)
        }
      }

      dynamic "committer_email_pattern" {
        for_each = rules.value.committer_email_pattern != null ? [rules.value.committer_email_pattern] : []
        content {
          operator = lookup(committer_email_pattern.value, "operator", null)
          pattern  = lookup(committer_email_pattern.value, "pattern", null)
          name     = lookup(committer_email_pattern.value, "name", null)
          negate   = lookup(committer_email_pattern.value, "negate", null)
        }
      }

      # -----------------------------------------------------------------------
      # Pull Requests & Checks
      # -----------------------------------------------------------------------

      dynamic "pull_request" {
        for_each = rules.value.pull_request != null ? [rules.value.pull_request] : []
        content {
          dismiss_stale_reviews_on_push     = lookup(pull_request.value, "dismiss_stale_reviews_on_push", null)
          require_code_owner_review         = lookup(pull_request.value, "require_code_owner_review", null)
          require_last_push_approval        = lookup(pull_request.value, "require_last_push_approval", null)
          required_approving_review_count   = lookup(pull_request.value, "required_approving_review_count", null)
          required_review_thread_resolution = lookup(pull_request.value, "required_review_thread_resolution", null)
        }
      }

      dynamic "required_status_checks" {
        for_each = rules.value.required_status_checks != null ? [rules.value.required_status_checks] : []
        content {
          strict_required_status_checks_policy = lookup(required_status_checks.value, "strict_required_status_checks_policy", null)
          do_not_enforce_on_create             = lookup(required_status_checks.value, "do_not_enforce_on_create", null)

          dynamic "required_check" {
            for_each = coalesce(required_status_checks.value.required_check, [])
            content {
              context        = required_check.value.context
              integration_id = required_check.value.integration_id
            }
          }
        }
      }

      dynamic "merge_queue" {
        for_each = rules.value.merge_queue != null ? [rules.value.merge_queue] : []
        content {
          check_response_timeout_minutes    = lookup(merge_queue.value, "check_response_timeout_minutes", null)
          grouping_strategy                 = lookup(merge_queue.value, "grouping_strategy", null)
          max_entries_to_build              = lookup(merge_queue.value, "max_entries_to_build", null)
          max_entries_to_merge              = lookup(merge_queue.value, "max_entries_to_merge", null)
          merge_method                      = lookup(merge_queue.value, "merge_method", null)
          min_entries_to_merge              = lookup(merge_queue.value, "min_entries_to_merge", null)
          min_entries_to_merge_wait_minutes = lookup(merge_queue.value, "min_entries_to_merge_wait_minutes", null)
        }
      }
    }
  }

  dynamic "bypass_actors" {
    for_each = coalesce(each.value.bypass_actors, [])
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
}
