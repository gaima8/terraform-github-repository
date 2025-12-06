[<img src="https://raw.githubusercontent.com/mineiros-io/brand/3bffd30e8bdbbde32c143e2650b2faa55f1df3ea/mineiros-primary-logo.svg" width="400"/>](https://mineiros.io/?ref=terraform-github-repository)

[![Build Status](https://github.com/mineiros-io/terraform-github-repository/workflows/CI/CD%20Pipeline/badge.svg)](https://github.com/mineiros-io/terraform-github-repository/actions)
[![GitHub tag (latest SemVer)](https://img.shields.io/github/v/tag/mineiros-io/terraform-github-repository.svg?label=latest&sort=semver)](https://github.com/mineiros-io/terraform-github-repository/releases)
[![Terraform Version](https://img.shields.io/badge/terraform-1.x-623CE4.svg?logo=terraform)](https://github.com/hashicorp/terraform/releases)
[![Github Provider Version](https://img.shields.io/badge/GH-4.31+-F8991D.svg?logo=terraform)](https://github.com/terraform-providers/terraform-provider-github/releases)
[![Join Slack](https://img.shields.io/badge/slack-@mineiros--community-f32752.svg?logo=slack)](https://join.slack.com/t/mineiros-community/shared_invite/zt-ehidestg-aLGoIENLVs6tvwJ11w9WGg)

# terraform-github-repository

A [Terraform] module for creating a public or private repository on [Github].

**_This module supports Terraform v1.x and is compatible with the Official Terraform GitHub Provider v4.31 and above from `integrations/github`._**

**Attention: This module is incompatible with the Hashicorp GitHub Provider! The latest version of this module supporting `hashicorp/github` provider is `~> 0.10.0`**

** Note: Versions 5.3.0, 5.4.0, 5.5.0, and 5.6.0 of the Terraform Github Provider have broken branch protections support and should not be used.**


- [GitHub as Code](#github-as-code)
- [Module Features](#module-features)
- [Getting Started](#getting-started)
- [Module Argument Reference](#module-argument-reference)
  - [Main Resource Configuration](#main-resource-configuration)
  - [Extended Resource Configuration](#extended-resource-configuration)
    - [Repository Creation Configuration](#repository-creation-configuration)
    - [Teams Configuration](#teams-configuration)
    - [Collaborator Configuration](#collaborator-configuration)
    - [Branches Configuration](#branches-configuration)
    - [Deploy Keys Configuration](#deploy-keys-configuration)
    - [Branch Protections v3 Configuration](#branch-protections-v3-configuration)
    - [Branch Protections v4 Configuration](#branch-protections-v4-configuration)
    - [Issue Labels Configuration](#issue-labels-configuration)
    - [Projects Configuration](#projects-configuration)
    - [Webhooks Configuration](#webhooks-configuration)
    - [Secrets Configuration](#secrets-configuration)
    - [Autolink References Configuration](#autolink-references-configuration)
    - [App Installations](#app-installations)
  - [Module Configuration](#module-configuration)
- [Module Outputs](#module-outputs)
- [External Documentation](#external-documentation)
  - [Terraform Github Provider Documentation](#terraform-github-provider-documentation)
- [Module Versioning](#module-versioning)
  - [Backwards compatibility in `0.0.z` and `0.y.z` version](#backwards-compatibility-in-00z-and-0yz-version)
- [About Mineiros](#about-mineiros)
- [Reporting Issues](#reporting-issues)
- [Contributing](#contributing)
- [Makefile Targets](#makefile-targets)
- [License](#license)

## GitHub as Code

[GitHub as Code][github-as-code] is a commercial solution built on top of
our open-source Terraform modules for GitHub. It helps our customers to
manage their GitHub organization more efficiently by enabling anyone in
their organization to **self-service** manage **on- and offboarding of users**,
**repositories**, and settings such as **branch protections**, **secrets**, and more
through code. GitHub as Code comes with **pre-configured GitHub Actions
pipelines** for **change pre-view in Pull Requests**, **fully automated
rollouts** and **rollbacks**. It's a comprehensive, ready-to-use blueprint
maintained by our team of platform engineering experts and saves
companies such as yours tons of time by building on top of a pre-configured
solution instead of building and maintaining it yourself.

For details please see [https://mineiros.io/github-as-code][github-as-code].

## Module Features

In contrast to the plain `github_repository` resource this module enables various other
features like Branch Protection or Collaborator Management.

- **Default Security Settings**:
  This module creates a `private` repository by default,
  Deploy keys are `read-only` by default

- **Standard Repository Features**:
  Setting basic Metadata,
  Merge Strategy,
  Auto Init,
  License Template,
  Gitignore Template,
  Template Repository

- **Extended Repository Features**:
  Branches,
  Branch Protection,
  Issue Labels,
  Handle Github Default Issue Labels,
  Collaborators,
  Teams,
  Deploy Keys,
  Projects,
  Repository Webhooks,
  GitHub App Installations

- _Features not yet implemented_:
  Project Columns support,
  Actions,
  Repository File

## Getting Started

Most basic usage creating a new private github repository.

```hcl
module "repository" {
  source  = "mineiros-io/repository/github"
  version = "~> 0.18.0"

  name               = "terraform-github-repository"
  license_template   = "apache-2.0"
  gitignore_template = "Terraform"
}
```

## Module Argument Reference

See [variables.tf] and [examples/] for details and use-cases.

### Main Resource Configuration

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

The following requirements are needed by this module:

- <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) (~> 1.3)

- <a name="requirement_github"></a> [github](#requirement\_github) (>= 6.2, < 7.0)

## Providers

The following providers are used by this module:

- <a name="provider_github"></a> [github](#provider\_github) (6.7.5)

## Modules

No modules.

## Resources

The following resources are used by this module:

- [github_actions_environment_variable.this](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/actions_environment_variable) (resource)
- [github_actions_secret.repository_secret](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/actions_secret) (resource)
- [github_actions_variable.repository_variable](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/actions_variable) (resource)
- [github_app_installation_repository.app_installation_repository](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/app_installation_repository) (resource)
- [github_branch.branch](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/branch) (resource)
- [github_branch_default.default](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/branch_default) (resource)
- [github_branch_protection.branch_protection](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/branch_protection) (resource)
- [github_branch_protection_v3.branch_protection](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/branch_protection_v3) (resource)
- [github_issue_label.label](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/issue_label) (resource)
- [github_repository.repository](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository) (resource)
- [github_repository_autolink_reference.repository_autolink_reference](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository_autolink_reference) (resource)
- [github_repository_collaborator.collaborator](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository_collaborator) (resource)
- [github_repository_deploy_key.deploy_key](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository_deploy_key) (resource)
- [github_repository_deploy_key.deploy_key_computed](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository_deploy_key) (resource)
- [github_repository_deployment_branch_policy.this](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository_deployment_branch_policy) (resource)
- [github_repository_environment.this](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository_environment) (resource)
- [github_repository_ruleset.ruleset](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository_ruleset) (resource)
- [github_repository_webhook.repository_webhook](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository_webhook) (resource)
- [github_team_repository.team_repository](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/team_repository) (resource)
- [github_team_repository.team_repository_by_slug](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/team_repository) (resource)
- [github_organization_teams.all](https://registry.terraform.io/providers/integrations/github/latest/docs/data-sources/organization_teams) (data source)
- [github_user.user](https://registry.terraform.io/providers/integrations/github/latest/docs/data-sources/user) (data source)

## Required Inputs

The following input variables are required:

### <a name="input_name"></a> [name](#input\_name)

Description: (Required) The name of the repository.

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_admin_collaborators"></a> [admin\_collaborators](#input\_admin\_collaborators)

Description: (Optional) A list of users to add as collaborators granting them admin (full) permission.

Type: `list(string)`

Default: `[]`

### <a name="input_admin_team_ids"></a> [admin\_team\_ids](#input\_admin\_team\_ids)

Description: (Optional) A list of teams (by id) to grant admin (full) permission to.

Type: `list(string)`

Default: `[]`

### <a name="input_admin_teams"></a> [admin\_teams](#input\_admin\_teams)

Description: (Optional) A list of teams (by name/slug) to grant admin (full) permission to.

Type: `list(string)`

Default: `[]`

### <a name="input_allow_auto_merge"></a> [allow\_auto\_merge](#input\_allow\_auto\_merge)

Description: (Optional) Set to true to allow auto-merging pull requests on the repository. If enabled for a pull request, the pull request will merge automatically when all required reviews are met and status checks have passed. (Default: false)

Type: `bool`

Default: `null`

### <a name="input_allow_merge_commit"></a> [allow\_merge\_commit](#input\_allow\_merge\_commit)

Description: (Optional) Set to false to disable merge commits on the repository. (Default: true)

Type: `bool`

Default: `null`

### <a name="input_allow_rebase_merge"></a> [allow\_rebase\_merge](#input\_allow\_rebase\_merge)

Description: (Optional) Set to true to enable rebase merges on the repository. (Default: false)

Type: `bool`

Default: `null`

### <a name="input_allow_squash_merge"></a> [allow\_squash\_merge](#input\_allow\_squash\_merge)

Description: (Optional) Set to true to enable squash merges on the repository. (Default: false)

Type: `bool`

Default: `null`

### <a name="input_allow_update_branch"></a> [allow\_update\_branch](#input\_allow\_update\_branch)

Description: (Optional) Set to true to suggest updating pull request branches. (Default: false)

Type: `bool`

Default: `null`

### <a name="input_app_installations"></a> [app\_installations](#input\_app\_installations)

Description: (Optional) A list of GitHub App IDs to be installed in this repository.

Type: `set(string)`

Default: `[]`

### <a name="input_archive_on_destroy"></a> [archive\_on\_destroy](#input\_archive\_on\_destroy)

Description: (Optional) Set to `false` to not archive the repository instead of deleting on destroy.

Type: `string`

Default: `true`

### <a name="input_archived"></a> [archived](#input\_archived)

Description: (Optional) Specifies if the repository should be archived. (Default: false)

Type: `bool`

Default: `false`

### <a name="input_auto_init"></a> [auto\_init](#input\_auto\_init)

Description: (Optional) Wether or not to produce an initial commit in the repository. (Default: true)

Type: `bool`

Default: `null`

### <a name="input_autolink_references"></a> [autolink\_references](#input\_autolink\_references)

Description: (Optional) Configuring autolink references. For details please check: https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository_autolink_reference

Type:

```hcl
list(object({
    key_prefix          = string
    target_url_template = string
  }))
```

Default: `[]`

### <a name="input_branch_protections_v3"></a> [branch\_protections\_v3](#input\_branch\_protections\_v3)

Description: (Optional) A list of branch protections to apply to the repository. Default is [] unless branch\_protections is set.

Type: `any`

Default: `[]`

### <a name="input_branch_protections_v4"></a> [branch\_protections\_v4](#input\_branch\_protections\_v4)

Description: (Optional) A list of v4 branch protections to apply to the repository. Default is [].

Type: `any`

Default: `[]`

### <a name="input_branches"></a> [branches](#input\_branches)

Description: (Optional) A list of branches to be created in this repository.

Type: `any`

Default: `[]`

### <a name="input_default_branch"></a> [default\_branch](#input\_default\_branch)

Description: (Optional) The name of the default branch of the repository. NOTE: This can only be set after a repository has already been created, and after a correct reference has been created for the target branch inside the repository. This means a user will have to omit this parameter from the initial repository creation and create the target branch inside of the repository prior to setting this attribute.

Type: `string`

Default: `null`

### <a name="input_defaults"></a> [defaults](#input\_defaults)

Description: (Deprecated) DEPRECATED. Please convert defaults to Terraform Module for\_each

Type: `any`

Default: `{}`

### <a name="input_delete_branch_on_merge"></a> [delete\_branch\_on\_merge](#input\_delete\_branch\_on\_merge)

Description: (Optional) Whether or not to delete the merged branch after merging a pull request. (Default: false)

Type: `bool`

Default: `null`

### <a name="input_deploy_keys"></a> [deploy\_keys](#input\_deploy\_keys)

Description: (Optional) Configure a deploy key ( SSH key ) that grants access to a single GitHub repository. This key is attached directly to the repository instead of to a personal user account.

Type: `any`

Default: `[]`

### <a name="input_deploy_keys_computed"></a> [deploy\_keys\_computed](#input\_deploy\_keys\_computed)

Description: (Optional) Configure a deploy key ( SSH key ) that grants access to a single GitHub repository. This key is attached directly to the repository instead of to a personal user account.

Type: `any`

Default: `[]`

### <a name="input_description"></a> [description](#input\_description)

Description: (Optional) A description of the repository.

Type: `string`

Default: `""`

### <a name="input_encrypted_secrets"></a> [encrypted\_secrets](#input\_encrypted\_secrets)

Description: (Optional) Configuring encrypted actions secrets. For details please check: https://www.terraform.io/docs/providers/github/r/actions_secret

Type: `map(string)`

Default: `{}`

### <a name="input_environments"></a> [environments](#input\_environments)

Description: n/a

Type:

```hcl
map(object({
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
```

Default: `{}`

### <a name="input_extra_topics"></a> [extra\_topics](#input\_extra\_topics)

Description: (Optional) The list of additional topics of the repository. (Default: [])

Type: `list(string)`

Default: `[]`

### <a name="input_gitignore_template"></a> [gitignore\_template](#input\_gitignore\_template)

Description: (Optional) Use the name of the template without the extension. For example, Haskell. Available templates: https://github.com/github/gitignore

Type: `string`

Default: `null`

### <a name="input_has_downloads"></a> [has\_downloads](#input\_has\_downloads)

Description: (Optional) Set to true to enable the (deprecated) downloads features on the repository. (Default: false)

Type: `bool`

Default: `null`

### <a name="input_has_issues"></a> [has\_issues](#input\_has\_issues)

Description: (Optional) Set to true to enable the GitHub Issues features on the repository. (Default: false)

Type: `bool`

Default: `null`

### <a name="input_has_wiki"></a> [has\_wiki](#input\_has\_wiki)

Description: (Optional) Set to true to enable the GitHub Wiki features on the repository. (Default: false)

Type: `bool`

Default: `null`

### <a name="input_homepage_url"></a> [homepage\_url](#input\_homepage\_url)

Description: (Optional) The website of the repository.

Type: `string`

Default: `null`

### <a name="input_is_template"></a> [is\_template](#input\_is\_template)

Description: (Optional) Whether or not to tell GitHub that this is a template repository. ( Default: false)

Type: `bool`

Default: `null`

### <a name="input_issue_labels"></a> [issue\_labels](#input\_issue\_labels)

Description: (Optional) Configure a GitHub issue label resource.

Type:

```hcl
list(object({
    name        = string
    description = string
    color       = string
  }))
```

Default: `[]`

### <a name="input_issue_labels_create"></a> [issue\_labels\_create](#input\_issue\_labels\_create)

Description: (Optional) Specify whether you want to force or suppress the creation of issues labels.

Type: `bool`

Default: `null`

### <a name="input_issue_labels_merge_with_github_labels"></a> [issue\_labels\_merge\_with\_github\_labels](#input\_issue\_labels\_merge\_with\_github\_labels)

Description: (Optional) Specify if you want to merge and control githubs default set of issue labels.

Type: `bool`

Default: `null`

### <a name="input_license_template"></a> [license\_template](#input\_license\_template)

Description: (Optional) Use the name of the template without the extension. For example, 'mit' or 'mpl-2.0'. Available licences: https://github.com/github/choosealicense.com/tree/gh-pages/_licenses

Type: `string`

Default: `null`

### <a name="input_maintain_collaborators"></a> [maintain\_collaborators](#input\_maintain\_collaborators)

Description: (Optional) A list of users to add as collaborators granting them maintain permission.

Type: `list(string)`

Default: `[]`

### <a name="input_maintain_team_ids"></a> [maintain\_team\_ids](#input\_maintain\_team\_ids)

Description: (Optional) A list of teams (by id) to grant maintain permission to.

Type: `list(string)`

Default: `[]`

### <a name="input_maintain_teams"></a> [maintain\_teams](#input\_maintain\_teams)

Description: (Optional) A list of teams (by name/slug) to grant maintain permission to.

Type: `list(string)`

Default: `[]`

### <a name="input_merge_commit_message"></a> [merge\_commit\_message](#input\_merge\_commit\_message)

Description: (Optional) Can be `PR_BODY`, `PR_TITLE`, or `BLANK` for a default merge commit message.

Type: `string`

Default: `"PR_TITLE"`

### <a name="input_merge_commit_title"></a> [merge\_commit\_title](#input\_merge\_commit\_title)

Description: (Optional) Can be `PR_TITLE` or `MERGE_MESSAGE` for a default merge commit title.

Type: `string`

Default: `"MERGE_MESSAGE"`

### <a name="input_module_depends_on"></a> [module\_depends\_on](#input\_module\_depends\_on)

Description: (Optional) Define resources this module indirectly depends\_on.

Type: `any`

Default: `[]`

### <a name="input_pages"></a> [pages](#input\_pages)

Description: (Optional) The repository's GitHub Pages configuration. (Default: {})

Type:

```hcl
object({
    branch     = optional(string)
    path       = optional(string, null)
    cname      = optional(string)
    build_type = optional(string, "legacy") # requires branch and optional path
  })
```

Default: `null`

### <a name="input_plaintext_secrets"></a> [plaintext\_secrets](#input\_plaintext\_secrets)

Description: (Optional) Configuring actions secrets. For details please check: https://www.terraform.io/docs/providers/github/r/actions_secret

Type: `map(string)`

Default: `{}`

### <a name="input_private"></a> [private](#input\_private)

Description: (Optional) (DEPRECATED: use visibility)

Type: `bool`

Default: `null`

### <a name="input_pull_collaborators"></a> [pull\_collaborators](#input\_pull\_collaborators)

Description: (Optional) A list of users to add as collaborators granting them pull (read-only) permission.

Type: `list(string)`

Default: `[]`

### <a name="input_pull_team_ids"></a> [pull\_team\_ids](#input\_pull\_team\_ids)

Description: (Optional) A list of teams (by id) to grant pull (read-only) permission to.

Type: `list(string)`

Default: `[]`

### <a name="input_pull_teams"></a> [pull\_teams](#input\_pull\_teams)

Description: (Optional) A list of teams (by name/slug) to grant pull (read-only) permission to.

Type: `list(string)`

Default: `[]`

### <a name="input_push_collaborators"></a> [push\_collaborators](#input\_push\_collaborators)

Description: (Optional) A list of users to add as collaborators granting them push (read-write) permission.

Type: `list(string)`

Default: `[]`

### <a name="input_push_team_ids"></a> [push\_team\_ids](#input\_push\_team\_ids)

Description: (Optional) A list of teams (by id) to grant push (read-write) permission to.

Type: `list(string)`

Default: `[]`

### <a name="input_push_teams"></a> [push\_teams](#input\_push\_teams)

Description: (Optional) A list of teams (by name/slug) to grant push (read-write) permission to.

Type: `list(string)`

Default: `[]`

### <a name="input_rulesets"></a> [rulesets](#input\_rulesets)

Description: (Optional) A list of branch rulesets to apply to the repository. Default is [].

Type:

```hcl
list(
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
            actor_id    = optional(number)
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
```

Default: `[]`

### <a name="input_squash_merge_commit_message"></a> [squash\_merge\_commit\_message](#input\_squash\_merge\_commit\_message)

Description: (Optional) Can be `PR_BODY`, `COMMIT_MESSAGES`, or `BLANK` for a default squash merge commit message.

Type: `string`

Default: `"COMMIT_MESSAGES"`

### <a name="input_squash_merge_commit_title"></a> [squash\_merge\_commit\_title](#input\_squash\_merge\_commit\_title)

Description: (Optional) Can be `PR_BODY`, `COMMIT_MESSAGES`, or `BLANK` for a default squash merge commit message.

Type: `string`

Default: `"COMMIT_OR_PR_TITLE"`

### <a name="input_template"></a> [template](#input\_template)

Description: (Optional) Template repository to use. (Default: {})

Type:

```hcl
object({
    owner      = string
    repository = string
  })
```

Default: `null`

### <a name="input_topics"></a> [topics](#input\_topics)

Description: (Optional) The list of topics of the repository.  (Default: [])

Type: `list(string)`

Default: `null`

### <a name="input_triage_collaborators"></a> [triage\_collaborators](#input\_triage\_collaborators)

Description: (Optional) A list of users to add as collaborators granting them triage permission.

Type: `list(string)`

Default: `[]`

### <a name="input_triage_team_ids"></a> [triage\_team\_ids](#input\_triage\_team\_ids)

Description: (Optional) A list of teams (by id) to grant triage permission to.

Type: `list(string)`

Default: `[]`

### <a name="input_triage_teams"></a> [triage\_teams](#input\_triage\_teams)

Description: (Optional) A list of teams (by name/slug) to grant triage permission to.

Type: `list(string)`

Default: `[]`

### <a name="input_variables"></a> [variables](#input\_variables)

Description: (Optional) Configure action variables. For full details please check: https://registry.terraform.io/providers/integrations/github/latest/docs/resources/actions_variable

Type: `map(string)`

Default: `{}`

### <a name="input_visibility"></a> [visibility](#input\_visibility)

Description: (Optional) Can be 'public', 'private' or 'internal' (GHE only).The visibility parameter overrides the private parameter. Defaults to 'private' if neither private nor visibility are set, default to state of private parameter if it is set.

Type: `string`

Default: `null`

### <a name="input_vulnerability_alerts"></a> [vulnerability\_alerts](#input\_vulnerability\_alerts)

Description: (Optional) Set to `false` to disable security alerts for vulnerable dependencies. Enabling requires alerts to be enabled on the owner level.

Type: `bool`

Default: `null`

### <a name="input_web_commit_signoff_required"></a> [web\_commit\_signoff\_required](#input\_web\_commit\_signoff\_required)

Description: (Optional) Require contributors to sign off on web-based commits.

Type: `bool`

Default: `null`

### <a name="input_webhooks"></a> [webhooks](#input\_webhooks)

Description: (Optional) Configuring webhooks. For details please check: https://www.terraform.io/docs/providers/github/r/repository_webhook.html

Type: `any`

Default: `[]`

## Outputs

The following outputs are exported:

### <a name="output_app_installations"></a> [app\_installations](#output\_app\_installations)

Description: A map of deploy app installations keyed by installation id.

### <a name="output_branches"></a> [branches](#output\_branches)

Description: A map of branch objects keyed by branch name.

### <a name="output_collaborators"></a> [collaborators](#output\_collaborators)

Description: A map of collaborator objects keyed by collaborator.name.

### <a name="output_deploy_keys"></a> [deploy\_keys](#output\_deploy\_keys)

Description: A map of deploy keys keyed by input id.

### <a name="output_full_name"></a> [full\_name](#output\_full\_name)

Description: A string of the form 'orgname/reponame'.

### <a name="output_git_clone_url"></a> [git\_clone\_url](#output\_git\_clone\_url)

Description: URL that can be provided to git clone to clone the repository anonymously via the git protocol.

### <a name="output_html_url"></a> [html\_url](#output\_html\_url)

Description: URL to the repository on the web.

### <a name="output_http_clone_url"></a> [http\_clone\_url](#output\_http\_clone\_url)

Description: URL that can be provided to git clone to clone the repository via HTTPS.

### <a name="output_issue_labels"></a> [issue\_labels](#output\_issue\_labels)

Description: A map of issue labels keyed by label input id or name.

### <a name="output_repository"></a> [repository](#output\_repository)

Description: All attributes and arguments as returned by the github\_repository resource.

### <a name="output_secrets"></a> [secrets](#output\_secrets)

Description: List of secrets available.

### <a name="output_ssh_clone_url"></a> [ssh\_clone\_url](#output\_ssh\_clone\_url)

Description: URL that can be provided to git clone to clone the repository via SSH.

### <a name="output_webhooks"></a> [webhooks](#output\_webhooks)

Description: All attributes and arguments as returned by the github\_repository\_webhook resource.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## External Documentation

### Terraform Github Provider Documentation

- https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository
- https://registry.terraform.io/providers/integrations/github/latest/docs/resources/branch
- https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository_collaborator
- https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository_deploy_key
- https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository_project
- https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository_autolink_reference

## Module Versioning

This Module follows the principles of [Semantic Versioning (SemVer)].

Given a version number `MAJOR.MINOR.PATCH`, we increment the:

1. `MAJOR` version when we make incompatible changes,
2. `MINOR` version when we add functionality in a backwards compatible manner, and
3. `PATCH` version when we make backwards compatible bug fixes.

### Backwards compatibility in `0.0.z` and `0.y.z` version

- Backwards compatibility in versions `0.0.z` is **not guaranteed** when `z` is increased. (Initial development)
- Backwards compatibility in versions `0.y.z` is **not guaranteed** when `y` is increased. (Pre-release)

## About Mineiros

[Mineiros][homepage] is a remote-first company headquartered in Berlin, Germany
that solves development, automation and security challenges in cloud infrastructure.

Our vision is to massively reduce time and overhead for teams to manage and
deploy production-grade and secure cloud infrastructure.

We offer commercial support for all of our modules and encourage you to reach out
if you have any questions or need help. Feel free to email us at [hello@mineiros.io] or join our
[Community Slack channel][slack].

## Reporting Issues

We use GitHub [Issues] to track community reported issues and missing features.

## Contributing

Contributions are always encouraged and welcome! For the process of accepting changes, we use
[Pull Requests]. If you'd like more information, please see our [Contribution Guidelines].

## Makefile Targets

This repository comes with a handy [Makefile].
Run `make help` to see details on each available target.

## License

[![license][badge-license]][apache20]

This module is licensed under the Apache License Version 2.0, January 2004.
Please see [LICENSE] for full details.

Copyright &copy; 2020-2022 [Mineiros GmbH][homepage]


<!-- References -->

[github]: https://github.com/
[`github_repository`]: https://www.terraform.io/docs/providers/github/r/repository.html#attributes-reference
[`github_repository_collaborator`]: https://www.terraform.io/docs/providers/github/r/repository_collaborator.html#attribute-reference
[`github_repository_deploy_key`]: https://www.terraform.io/docs/providers/github/r/repository_deploy_key.html#attributes-reference
[`github_repository_project`]: https://www.terraform.io/docs/providers/github/r/repository_project.html#attributes-reference
[`github_repository_autolink_reference`]: https://www.terraform.io/docs/providers/github/r/repository_autolink_reference.html#attributes-reference
[homepage]: https://mineiros.io/?ref=terraform-github-repository
[github-as-code]: https://mineiros.io/github-as-code?ref=terraform-github-repository
[hello@mineiros.io]: mailto:hello@mineiros.io
[badge-build]: https://github.com/mineiros-io/terraform-github-repository/workflows/CI/CD%20Pipeline/badge.svg
[badge-semver]: https://img.shields.io/github/v/tag/mineiros-io/terraform-github-repository.svg?label=latest&sort=semver
[badge-license]: https://img.shields.io/badge/license-Apache%202.0-brightgreen.svg
[badge-terraform]: https://img.shields.io/badge/terraform-1.x-623CE4.svg?logo=terraform
[badge-slack]: https://img.shields.io/badge/slack-@mineiros--community-f32752.svg?logo=slack
[badge-tf-gh]: https://img.shields.io/badge/GH-4.10+-F8991D.svg?logo=terraform
[releases-github-provider]: https://github.com/terraform-providers/terraform-provider-github/releases
[build-status]: https://github.com/mineiros-io/terraform-github-repository/actions
[releases-github]: https://github.com/mineiros-io/terraform-github-repository/releases
[releases-terraform]: https://github.com/hashicorp/terraform/releases
[apache20]: https://opensource.org/licenses/Apache-2.0
[slack]: https://join.slack.com/t/mineiros-community/shared_invite/zt-ehidestg-aLGoIENLVs6tvwJ11w9WGg
[terraform]: https://www.terraform.io
[aws]: https://aws.amazon.com/
[semantic versioning (semver)]: https://semver.org/
[variables.tf]: https://github.com/mineiros-io/terraform-github-repository/blob/main/variables.tf
[examples/]: https://github.com/mineiros-io/terraform-github-repository/blob/main/examples
[issues]: https://github.com/mineiros-io/terraform-github-repository/issues
[license]: https://github.com/mineiros-io/terraform-github-repository/blob/main/LICENSE
[makefile]: https://github.com/mineiros-io/terraform-github-repository/blob/main/Makefile
[pull requests]: https://github.com/mineiros-io/terraform-github-repository/pulls
[contribution guidelines]: https://github.com/mineiros-io/terraform-github-repository/blob/main/CONTRIBUTING.md
