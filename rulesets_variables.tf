variable "rulesets" {
  description = "(Optional) A list of branch rulesets to apply to the repository. Default is []."
  default     = []
  type = list(
    object({
      enforcement = string
      name        = string
      target      = string

      rules = list(
        object({
          creation                      = optional(bool)
          deletion                      = optional(bool)
          non_fast_forward              = optional(bool)
          required_signatures           = optional(bool)
          required_linear_history       = optional(bool)
          update                        = optional(bool)
          update_allows_fetch_and_merge = optional(bool)

          branch_name_pattern = optional(
            object({
              operator = string
              pattern  = string
              name     = optional(string)
              negate   = optional(bool)
            })
          )

          commit_author_email_pattern = optional(
            object({
              operator = string
              pattern  = string
              name     = optional(string)
              negate   = optional(bool)
            })
          )

          commit_message_pattern = optional(
            object({
              operator = string
              pattern  = string
              name     = optional(string)
              negate   = optional(bool)
            })
          )

          committer_email_pattern = optional(
            object({
              operator = string
              pattern  = string
              name     = optional(string)
              negate   = optional(bool)
            })
          )

          tag_name_pattern = optional(
            object({
              operator = string
              pattern  = string
              name     = optional(string)
              negate   = optional(bool)
            })
          )

          required_status_checks = optional(
            object({
              strict_required_status_checks_policy = optional(bool)
              do_not_enforce_on_create             = optional(bool)
              required_check = list(
                object({
                  context        = string
                  integration_id = optional(number)
                })
              )
            })
          )

          pull_request = optional(
            object({
              dismiss_stale_reviews_on_push     = optional(bool)
              require_code_owner_review         = optional(bool)
              require_last_push_approval        = optional(bool)
              required_approving_review_count   = optional(number)
              required_review_thread_resolution = optional(bool)
            })
          )

          required_workflows = optional(
            object({
              required_workflow = list(
                object({
                  repository_id = number
                  ref           = string
                  path          = string
                })
              )
            })
          )

          required_deployments = optional(
            object({
              required_deployment_environments = list(string)
            })
          )

          required_code_scanning = optional(
            object({
              required_code_scanning_tool = list(
                object({
                  tool                      = string
                  alerts_threshold          = string
                  security_alerts_threshold = string
                })
              )
            })
          )

          merge_queue = optional(
            object({
              check_response_timeout_minutes    = optional(number)
              grouping_strategy                 = optional(string)
              max_entries_to_build              = optional(number)
              max_entries_to_merge              = optional(number)
              merge_method                      = optional(string)
              min_entries_to_merge              = optional(number)
              min_entries_to_merge_wait_minutes = optional(number)
            })
          )
        })
      )

      bypass_actors = optional(
        list(
          object({
            actor_id    = number
            actor_type  = string
            bypass_mode = optional(string)
          })
        )
      )

      conditions = optional(
        object({
          ref_name = object({
            include = list(string)
            exclude = list(string)
          })
        })
      )
    })
  )

  validation {
    condition = alltrue([
      for rs in var.rulesets : length(rs.rules) == 1
    ])
    error_message = "Each ruleset must contain exactly one rule in its 'rules' list."
  }

  validation {
    condition = alltrue([
      for rs in var.rulesets :
      contains(["disabled", "active", "evaluate"], rs.enforcement)
    ])
    error_message = "Each ruleset.enforcement must be one of: disabled, active, evaluate."
  }

  validation {
    condition = alltrue([
      for rs in var.rulesets :
      contains(["branch", "tag", "push"], rs.target)
    ])
    error_message = "Each ruleset.target must be one of: branch, tag, or push."
  }

  validation {
    condition = alltrue(
      flatten([
        for rs in var.rulesets : [
          for ba in coalesce(rs.bypass_actors, []) :
          contains(
            ["RepositoryRole", "Team", "Integration", "OrganizationAdmin", "DeployKey"],
            ba.actor_type
          )
        ]
      ])
    )
    error_message = "Each bypass_actors.actor_type must be one of: RepositoryRole, Team, Integration, OrganizationAdmin, DeployKey."
  }
}
