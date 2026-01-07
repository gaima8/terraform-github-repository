[![GitHub tag (latest SemVer)](https://img.shields.io/github/v/tag/gaima8/terraform-github-repository.svg?label=latest&sort=semver)](https://github.com/gaima8/terraform-github-repository/releases)
[![license](https://img.shields.io/badge/license-Apache%202.0-brightgreen.svg)](https://opensource.org/licenses/Apache-2.0)
[![Terraform Version](https://img.shields.io/badge/terraform-1.7-623CE4.svg?logo=terraform)](https://github.com/hashicorp/terraform/releases)
[![Github Provider Version](https://img.shields.io/badge/GH-6.9+-F8991D.svg?logo=terraform)](https://github.com/terraform-providers/terraform-provider-github/releases)

# terraform-github-repository

A [Terraform] module for creating a public or private repository on [Github].

**_This module supports Terraform >=v1.7 and is compatible with the Official Terraform GitHub Provider v6.9 and above from `integrations/github`._**

- [terraform-github-repository](#terraform-github-repository)
  - [Module Features](#module-features)
  - [Getting Started](#getting-started)
  - [Module Argument Reference](#module-argument-reference)
  - [Main Resource Configuration](#main-resource-configuration)
    - [Requirements](#requirements)
    - [Providers](#providers)
    - [Resources](#resources)
    - [Inputs](#inputs)
    - [Outputs](#outputs)
    - [Security And Analysis Configuration](#security-and-analysis-configuration)
  - [External Documentation](#external-documentation)
    - [Terraform Github Provider Documentation](#terraform-github-provider-documentation)
  - [Module Versioning](#module-versioning)
  - [Reporting Issues](#reporting-issues)
  - [Contributing](#contributing)
  - [Attribution](#attribution)
  - [License](#license)

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
  Rulesets,
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
  source  = "gaima8/repository/github"
  version = "~> 2.0.0"

  name               = "terraform-github-repository"
  license_template   = "apache-2.0"
  gitignore_template = "Terraform"
}
```

## Module Argument Reference

See [variables.tf] and [examples/] for details and use-cases.

## Main Resource Configuration

<!-- BEGIN_TF_DOCS -->
### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.7 |
| <a name="requirement_github"></a> [github](#requirement\_github) | >= 6.9.1 |

### Providers

| Name | Version |
|------|---------|
| <a name="provider_github"></a> [github](#provider\_github) | >= 6.9.1 |

### Resources

| Name | Type |
|------|------|
| [github_actions_environment_variable.this](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/actions_environment_variable) | resource |
| [github_actions_secret.repository_secret](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/actions_secret) | resource |
| [github_actions_variable.repository_variable](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/actions_variable) | resource |
| [github_app_installation_repository.app_installation_repository](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/app_installation_repository) | resource |
| [github_branch.branch](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/branch) | resource |
| [github_branch_default.default](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/branch_default) | resource |
| [github_branch_protection.branch_protection](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/branch_protection) | resource |
| [github_branch_protection_v3.branch_protection](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/branch_protection_v3) | resource |
| [github_issue_label.label](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/issue_label) | resource |
| [github_repository.repository](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository) | resource |
| [github_repository_autolink_reference.repository_autolink_reference](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository_autolink_reference) | resource |
| [github_repository_collaborator.collaborator](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository_collaborator) | resource |
| [github_repository_deploy_key.deploy_key](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository_deploy_key) | resource |
| [github_repository_deploy_key.deploy_key_computed](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository_deploy_key) | resource |
| [github_repository_environment.this](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository_environment) | resource |
| [github_repository_environment_deployment_policy.this](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository_environment_deployment_policy) | resource |
| [github_repository_ruleset.ruleset](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository_ruleset) | resource |
| [github_repository_webhook.repository_webhook](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository_webhook) | resource |
| [github_team_repository.team_repository](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/team_repository) | resource |
| [github_team_repository.team_repository_by_slug](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/team_repository) | resource |
| [github_team.reviewers](https://registry.terraform.io/providers/integrations/github/latest/docs/data-sources/team) | data source |
| [github_user.user](https://registry.terraform.io/providers/integrations/github/latest/docs/data-sources/user) | data source |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_admin_collaborators"></a> [admin\_collaborators](#input\_admin\_collaborators) | (Optional) A list of users to add as collaborators granting them admin (full) permission. | `list(string)` | `[]` | no |
| <a name="input_admin_team_ids"></a> [admin\_team\_ids](#input\_admin\_team\_ids) | (Optional) A list of teams (by id) to grant admin (full) permission to. | `list(string)` | `[]` | no |
| <a name="input_admin_teams"></a> [admin\_teams](#input\_admin\_teams) | (Optional) A list of teams (by name/slug) to grant admin (full) permission to. | `list(string)` | `[]` | no |
| <a name="input_allow_auto_merge"></a> [allow\_auto\_merge](#input\_allow\_auto\_merge) | (Optional) Set to true to allow auto-merging pull requests on the repository. If enabled for a pull request, the pull request will merge automatically when all required reviews are met and status checks have passed. (Default: false) | `bool` | `null` | no |
| <a name="input_allow_merge_commit"></a> [allow\_merge\_commit](#input\_allow\_merge\_commit) | (Optional) Set to false to disable merge commits on the repository. (Default: true) | `bool` | `null` | no |
| <a name="input_allow_rebase_merge"></a> [allow\_rebase\_merge](#input\_allow\_rebase\_merge) | (Optional) Set to true to enable rebase merges on the repository. (Default: false) | `bool` | `null` | no |
| <a name="input_allow_squash_merge"></a> [allow\_squash\_merge](#input\_allow\_squash\_merge) | (Optional) Set to true to enable squash merges on the repository. (Default: false) | `bool` | `null` | no |
| <a name="input_allow_update_branch"></a> [allow\_update\_branch](#input\_allow\_update\_branch) | (Optional) Set to true to suggest updating pull request branches. (Default: false) | `bool` | `null` | no |
| <a name="input_app_installations"></a> [app\_installations](#input\_app\_installations) | (Optional) A list of GitHub App IDs to be installed in this repository. | `set(string)` | `[]` | no |
| <a name="input_archive_on_destroy"></a> [archive\_on\_destroy](#input\_archive\_on\_destroy) | (Optional) Set to `false` to not archive the repository instead of deleting on destroy. | `string` | `true` | no |
| <a name="input_archived"></a> [archived](#input\_archived) | (Optional) Specifies if the repository should be archived. (Default: false) | `bool` | `false` | no |
| <a name="input_auto_init"></a> [auto\_init](#input\_auto\_init) | (Optional) Wether or not to produce an initial commit in the repository. (Default: true) | `bool` | `null` | no |
| <a name="input_autolink_references"></a> [autolink\_references](#input\_autolink\_references) | (Optional) Configuring autolink references. For details please check: https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository_autolink_reference | <pre>list(object({<br/>    key_prefix          = string<br/>    target_url_template = string<br/>    is_alphanumeric     = optional(bool)<br/>  }))</pre> | `[]` | no |
| <a name="input_branch_protections_v3"></a> [branch\_protections\_v3](#input\_branch\_protections\_v3) | (Optional) A list of branch protections to apply to the repository. Default is [] unless branch\_protections is set. | `any` | `[]` | no |
| <a name="input_branch_protections_v4"></a> [branch\_protections\_v4](#input\_branch\_protections\_v4) | (Optional) A list of v4 branch protections to apply to the repository. Default is []. | `any` | `[]` | no |
| <a name="input_branches"></a> [branches](#input\_branches) | (Optional) A list of branches to be created in this repository. | `any` | `[]` | no |
| <a name="input_default_branch"></a> [default\_branch](#input\_default\_branch) | (Optional) The name of the default branch of the repository. NOTE: This can only be set after a repository has already been created, and after a correct reference has been created for the target branch inside the repository. This means a user will have to omit this parameter from the initial repository creation and create the target branch inside of the repository prior to setting this attribute. | `string` | `null` | no |
| <a name="input_defaults"></a> [defaults](#input\_defaults) | (Deprecated) DEPRECATED. Please convert defaults to Terraform Module for\_each | `any` | `{}` | no |
| <a name="input_delete_branch_on_merge"></a> [delete\_branch\_on\_merge](#input\_delete\_branch\_on\_merge) | (Optional) Whether or not to delete the merged branch after merging a pull request. (Default: false) | `bool` | `null` | no |
| <a name="input_deploy_keys"></a> [deploy\_keys](#input\_deploy\_keys) | (Optional) Configure a deploy key ( SSH key ) that grants access to a single GitHub repository. This key is attached directly to the repository instead of to a personal user account. | `any` | `[]` | no |
| <a name="input_deploy_keys_computed"></a> [deploy\_keys\_computed](#input\_deploy\_keys\_computed) | (Optional) Configure a deploy key ( SSH key ) that grants access to a single GitHub repository. This key is attached directly to the repository instead of to a personal user account. | `any` | `[]` | no |
| <a name="input_description"></a> [description](#input\_description) | (Optional) A description of the repository. | `string` | `""` | no |
| <a name="input_encrypted_secrets"></a> [encrypted\_secrets](#input\_encrypted\_secrets) | (Optional) Configuring encrypted actions secrets. For details please check: https://www.terraform.io/docs/providers/github/r/actions_secret | `map(string)` | `{}` | no |
| <a name="input_environments"></a> [environments](#input\_environments) | n/a | <pre>map(object({<br/>    reviewer_teams = optional(list(string), [])<br/>    reviewer_users = optional(list(string), [])<br/>    deployment_branch_policy = optional(object({<br/>      protected_branches     = bool<br/>      custom_branch_policies = optional(bool)<br/>    }))<br/>    branch_patterns     = optional(list(string), [])<br/>    variables           = optional(map(string), {})<br/>    wait_timer          = optional(number)<br/>    prevent_self_review = optional(bool)<br/>  }))</pre> | `{}` | no |
| <a name="input_extra_topics"></a> [extra\_topics](#input\_extra\_topics) | (Optional) The list of additional topics of the repository. (Default: []) | `list(string)` | `[]` | no |
| <a name="input_gitignore_template"></a> [gitignore\_template](#input\_gitignore\_template) | (Optional) Use the name of the template without the extension. For example, Haskell. Available templates: https://github.com/github/gitignore | `string` | `null` | no |
| <a name="input_has_downloads"></a> [has\_downloads](#input\_has\_downloads) | (Optional) Set to true to enable the (deprecated) downloads features on the repository. (Default: false) | `bool` | `null` | no |
| <a name="input_has_issues"></a> [has\_issues](#input\_has\_issues) | (Optional) Set to true to enable the GitHub Issues features on the repository. (Default: false) | `bool` | `null` | no |
| <a name="input_has_wiki"></a> [has\_wiki](#input\_has\_wiki) | (Optional) Set to true to enable the GitHub Wiki features on the repository. (Default: false) | `bool` | `null` | no |
| <a name="input_homepage_url"></a> [homepage\_url](#input\_homepage\_url) | (Optional) The website of the repository. | `string` | `null` | no |
| <a name="input_is_template"></a> [is\_template](#input\_is\_template) | (Optional) Whether or not to tell GitHub that this is a template repository. ( Default: false) | `bool` | `null` | no |
| <a name="input_issue_labels"></a> [issue\_labels](#input\_issue\_labels) | (Optional) Configure a GitHub issue label resource. | <pre>list(object({<br/>    name        = string<br/>    description = string<br/>    color       = string<br/>  }))</pre> | `[]` | no |
| <a name="input_issue_labels_create"></a> [issue\_labels\_create](#input\_issue\_labels\_create) | (Optional) Specify whether you want to force or suppress the creation of issues labels. | `bool` | `null` | no |
| <a name="input_issue_labels_merge_with_github_labels"></a> [issue\_labels\_merge\_with\_github\_labels](#input\_issue\_labels\_merge\_with\_github\_labels) | (Optional) Specify if you want to merge and control githubs default set of issue labels. | `bool` | `null` | no |
| <a name="input_license_template"></a> [license\_template](#input\_license\_template) | (Optional) Use the name of the template without the extension. For example, 'mit' or 'mpl-2.0'. Available licences: https://github.com/github/choosealicense.com/tree/gh-pages/_licenses | `string` | `null` | no |
| <a name="input_maintain_collaborators"></a> [maintain\_collaborators](#input\_maintain\_collaborators) | (Optional) A list of users to add as collaborators granting them maintain permission. | `list(string)` | `[]` | no |
| <a name="input_maintain_team_ids"></a> [maintain\_team\_ids](#input\_maintain\_team\_ids) | (Optional) A list of teams (by id) to grant maintain permission to. | `list(string)` | `[]` | no |
| <a name="input_maintain_teams"></a> [maintain\_teams](#input\_maintain\_teams) | (Optional) A list of teams (by name/slug) to grant maintain permission to. | `list(string)` | `[]` | no |
| <a name="input_merge_commit_message"></a> [merge\_commit\_message](#input\_merge\_commit\_message) | (Optional) Can be `PR_BODY`, `PR_TITLE`, or `BLANK` for a default merge commit message. | `string` | `"PR_TITLE"` | no |
| <a name="input_merge_commit_title"></a> [merge\_commit\_title](#input\_merge\_commit\_title) | (Optional) Can be `PR_TITLE` or `MERGE_MESSAGE` for a default merge commit title. | `string` | `"MERGE_MESSAGE"` | no |
| <a name="input_module_depends_on"></a> [module\_depends\_on](#input\_module\_depends\_on) | (Optional) Define resources this module indirectly depends\_on. | `any` | `[]` | no |
| <a name="input_name"></a> [name](#input\_name) | (Required) The name of the repository. | `string` | n/a | yes |
| <a name="input_pages"></a> [pages](#input\_pages) | (Optional) The repository's GitHub Pages configuration. (Default: {}) | <pre>object({<br/>    branch     = optional(string)<br/>    path       = optional(string, null)<br/>    cname      = optional(string)<br/>    build_type = optional(string, "legacy") # requires branch and optional path<br/>  })</pre> | `null` | no |
| <a name="input_plaintext_secrets"></a> [plaintext\_secrets](#input\_plaintext\_secrets) | (Optional) Configuring actions secrets. For details please check: https://www.terraform.io/docs/providers/github/r/actions_secret | `map(string)` | `{}` | no |
| <a name="input_private"></a> [private](#input\_private) | (Optional) (DEPRECATED: use visibility) | `bool` | `null` | no |
| <a name="input_pull_collaborators"></a> [pull\_collaborators](#input\_pull\_collaborators) | (Optional) A list of users to add as collaborators granting them pull (read-only) permission. | `list(string)` | `[]` | no |
| <a name="input_pull_team_ids"></a> [pull\_team\_ids](#input\_pull\_team\_ids) | (Optional) A list of teams (by id) to grant pull (read-only) permission to. | `list(string)` | `[]` | no |
| <a name="input_pull_teams"></a> [pull\_teams](#input\_pull\_teams) | (Optional) A list of teams (by name/slug) to grant pull (read-only) permission to. | `list(string)` | `[]` | no |
| <a name="input_push_collaborators"></a> [push\_collaborators](#input\_push\_collaborators) | (Optional) A list of users to add as collaborators granting them push (read-write) permission. | `list(string)` | `[]` | no |
| <a name="input_push_team_ids"></a> [push\_team\_ids](#input\_push\_team\_ids) | (Optional) A list of teams (by id) to grant push (read-write) permission to. | `list(string)` | `[]` | no |
| <a name="input_push_teams"></a> [push\_teams](#input\_push\_teams) | (Optional) A list of teams (by name/slug) to grant push (read-write) permission to. | `list(string)` | `[]` | no |
| <a name="input_rulesets"></a> [rulesets](#input\_rulesets) | (Optional) A list of branch rulesets to apply to the repository. Default is [].<br/><br/>It is very likely removal of any section will require setting it to an empty list/map.<br/>This is due to limitations in the API whereby components are not destroyed upon removal. | <pre>list(<br/>    object({<br/>      enforcement = string<br/>      name        = string<br/>      target      = string<br/><br/>      rules = list(<br/>        object({<br/>          creation                      = optional(bool)<br/>          deletion                      = optional(bool)<br/>          non_fast_forward              = optional(bool)<br/>          required_signatures           = optional(bool)<br/>          required_linear_history       = optional(bool)<br/>          update                        = optional(bool)<br/>          update_allows_fetch_and_merge = optional(bool)<br/><br/>          branch_name_pattern = optional(<br/>            object({<br/>              operator = string<br/>              pattern  = string<br/>              name     = optional(string)<br/>              negate   = optional(bool)<br/>            })<br/>          )<br/><br/>          commit_author_email_pattern = optional(<br/>            object({<br/>              operator = string<br/>              pattern  = string<br/>              name     = optional(string)<br/>              negate   = optional(bool)<br/>            })<br/>          )<br/><br/>          commit_message_pattern = optional(<br/>            object({<br/>              operator = string<br/>              pattern  = string<br/>              name     = optional(string)<br/>              negate   = optional(bool)<br/>            })<br/>          )<br/><br/>          committer_email_pattern = optional(<br/>            object({<br/>              operator = string<br/>              pattern  = string<br/>              name     = optional(string)<br/>              negate   = optional(bool)<br/>            })<br/>          )<br/><br/>          tag_name_pattern = optional(<br/>            object({<br/>              operator = string<br/>              pattern  = string<br/>              name     = optional(string)<br/>              negate   = optional(bool)<br/>            })<br/>          )<br/><br/>          required_status_checks = optional(<br/>            object({<br/>              strict_required_status_checks_policy = optional(bool)<br/>              do_not_enforce_on_create             = optional(bool)<br/>              required_check = list(<br/>                object({<br/>                  context        = string<br/>                  integration_id = optional(number)<br/>                })<br/>              )<br/>            })<br/>          )<br/><br/>          pull_request = optional(<br/>            object({<br/>              dismiss_stale_reviews_on_push     = optional(bool)<br/>              require_code_owner_review         = optional(bool)<br/>              require_last_push_approval        = optional(bool)<br/>              required_approving_review_count   = optional(number)<br/>              required_review_thread_resolution = optional(bool)<br/>            })<br/>          )<br/><br/>          required_workflows = optional(<br/>            object({<br/>              required_workflow = list(<br/>                object({<br/>                  repository_id = number<br/>                  ref           = string<br/>                  path          = string<br/>                })<br/>              )<br/>            })<br/>          )<br/><br/>          required_deployments = optional(<br/>            object({<br/>              required_deployment_environments = list(string)<br/>            })<br/>          )<br/><br/>          required_code_scanning = optional(<br/>            object({<br/>              required_code_scanning_tool = list(<br/>                object({<br/>                  tool                      = string<br/>                  alerts_threshold          = string<br/>                  security_alerts_threshold = string<br/>                })<br/>              )<br/>            })<br/>          )<br/><br/>          merge_queue = optional(<br/>            object({<br/>              check_response_timeout_minutes    = optional(number)<br/>              grouping_strategy                 = optional(string)<br/>              max_entries_to_build              = optional(number)<br/>              max_entries_to_merge              = optional(number)<br/>              merge_method                      = optional(string)<br/>              min_entries_to_merge              = optional(number)<br/>              min_entries_to_merge_wait_minutes = optional(number)<br/>            })<br/>          )<br/>        })<br/>      )<br/><br/>      bypass_actors = optional(<br/>        list(<br/>          object({<br/>            actor_id    = optional(number)<br/>            actor_type  = string<br/>            bypass_mode = optional(string)<br/>          })<br/>        )<br/>      )<br/><br/>      conditions = optional(<br/>        object({<br/>          ref_name = object({<br/>            include = list(string)<br/>            exclude = list(string)<br/>          })<br/>        })<br/>      )<br/>    })<br/>  )</pre> | `[]` | no |
| <a name="input_security_and_analysis"></a> [security\_and\_analysis](#input\_security\_and\_analysis) | (Optional) Security and analysis configuration for the repository.<br/><br/>- All fields except org\_advanced\_security are strings: "enabled" or "disabled".<br/>- org\_advanced\_security is a bool indicating whether the org has split licensing for Advanced Security. | <pre>object({<br/>    org_advanced_security                 = optional(bool, false)<br/>    advanced_security                     = optional(string, "disabled")<br/>    code_security                         = optional(string, "disabled")<br/>    secret_scanning                       = optional(string, "disabled")<br/>    secret_scanning_push_protection       = optional(string, "disabled")<br/>    secret_scanning_ai_detection          = optional(string, "disabled")<br/>    secret_scanning_non_provider_patterns = optional(string, "disabled")<br/>  })</pre> | `null` | no |
| <a name="input_squash_merge_commit_message"></a> [squash\_merge\_commit\_message](#input\_squash\_merge\_commit\_message) | (Optional) Can be `PR_BODY`, `COMMIT_MESSAGES`, or `BLANK` for a default squash merge commit message. | `string` | `"COMMIT_MESSAGES"` | no |
| <a name="input_squash_merge_commit_title"></a> [squash\_merge\_commit\_title](#input\_squash\_merge\_commit\_title) | (Optional) Can be `PR_BODY`, `COMMIT_MESSAGES`, or `BLANK` for a default squash merge commit message. | `string` | `"COMMIT_OR_PR_TITLE"` | no |
| <a name="input_template"></a> [template](#input\_template) | (Optional) Template repository to use. (Default: {}) | <pre>object({<br/>    owner                = string<br/>    repository           = string<br/>    include_all_branches = optional(bool, false)<br/>  })</pre> | `null` | no |
| <a name="input_topics"></a> [topics](#input\_topics) | (Optional) The list of topics of the repository.  (Default: []) | `list(string)` | `null` | no |
| <a name="input_triage_collaborators"></a> [triage\_collaborators](#input\_triage\_collaborators) | (Optional) A list of users to add as collaborators granting them triage permission. | `list(string)` | `[]` | no |
| <a name="input_triage_team_ids"></a> [triage\_team\_ids](#input\_triage\_team\_ids) | (Optional) A list of teams (by id) to grant triage permission to. | `list(string)` | `[]` | no |
| <a name="input_triage_teams"></a> [triage\_teams](#input\_triage\_teams) | (Optional) A list of teams (by name/slug) to grant triage permission to. | `list(string)` | `[]` | no |
| <a name="input_variables"></a> [variables](#input\_variables) | (Optional) Configure action variables. For full details please check: https://registry.terraform.io/providers/integrations/github/latest/docs/resources/actions_variable | `map(string)` | `{}` | no |
| <a name="input_visibility"></a> [visibility](#input\_visibility) | (Optional) Can be 'public', 'private' or 'internal' (GHE only).The visibility parameter overrides the private parameter. Defaults to 'private' if neither private nor visibility are set, default to state of private parameter if it is set. | `string` | `null` | no |
| <a name="input_vulnerability_alerts"></a> [vulnerability\_alerts](#input\_vulnerability\_alerts) | (Optional) Set to `false` to disable security alerts for vulnerable dependencies. Enabling requires alerts to be enabled on the owner level. | `bool` | `null` | no |
| <a name="input_web_commit_signoff_required"></a> [web\_commit\_signoff\_required](#input\_web\_commit\_signoff\_required) | (Optional) Require contributors to sign off on web-based commits. | `bool` | `null` | no |
| <a name="input_webhooks"></a> [webhooks](#input\_webhooks) | (Optional) Configuring webhooks. For details please check: https://www.terraform.io/docs/providers/github/r/repository_webhook.html | `any` | `[]` | no |

### Outputs

| Name | Description |
|------|-------------|
| <a name="output_app_installations"></a> [app\_installations](#output\_app\_installations) | A map of deploy app installations keyed by installation id. |
| <a name="output_branches"></a> [branches](#output\_branches) | A map of branch objects keyed by branch name. |
| <a name="output_collaborators"></a> [collaborators](#output\_collaborators) | A map of collaborator objects keyed by collaborator.name. |
| <a name="output_deploy_keys"></a> [deploy\_keys](#output\_deploy\_keys) | A map of deploy keys keyed by input id. |
| <a name="output_full_name"></a> [full\_name](#output\_full\_name) | A string of the form 'orgname/reponame'. |
| <a name="output_git_clone_url"></a> [git\_clone\_url](#output\_git\_clone\_url) | URL that can be provided to git clone to clone the repository anonymously via the git protocol. |
| <a name="output_html_url"></a> [html\_url](#output\_html\_url) | URL to the repository on the web. |
| <a name="output_http_clone_url"></a> [http\_clone\_url](#output\_http\_clone\_url) | URL that can be provided to git clone to clone the repository via HTTPS. |
| <a name="output_issue_labels"></a> [issue\_labels](#output\_issue\_labels) | A map of issue labels keyed by label input id or name. |
| <a name="output_repository"></a> [repository](#output\_repository) | All attributes and arguments as returned by the github\_repository resource. |
| <a name="output_secrets"></a> [secrets](#output\_secrets) | List of secrets available. |
| <a name="output_ssh_clone_url"></a> [ssh\_clone\_url](#output\_ssh\_clone\_url) | URL that can be provided to git clone to clone the repository via SSH. |
| <a name="output_webhooks"></a> [webhooks](#output\_webhooks) | All attributes and arguments as returned by the github\_repository\_webhook resource. |
<!-- END_TF_DOCS -->

### Security And Analysis Configuration

- [**`security_and_analysis`**](#var-security_and_analysis): *(Optional `object(security_and_analysis)`)*<a name="var-security_and_analysis"></a>

  (Optional) The repository's [security and analysis](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/enabling-features-for-your-repository/managing-security-and-analysis-settings-for-your-repository) configuration.
  See [Security and Analysis Configuration](#security-and-analysis-configuration) below for details.

  Default is `null`.

  The `security_and_analysis` object accepts the following attributes:

  - [**`org_advanced_security`**](#attr-security_and_analysis-org_advanced_security: *(**Optional** `bool`)*<a name="attr-security_and_analysis-org_advanced_security"></a>

    If your GitHub Organization has split licensing for Advanced Security you can have Security and Analysis on non-public repositories. Otherwise Security and Analysis operates on all public repositories. Currently there is no known way to automatically detect this.

    Define `org_advanced_security` as true to give more visibility options.

  - [**`advanced_security`**](#attr-security_and_analysis-advanced_security): *(**Optional** `string`)*<a name="attr-security_and_analysis-advanced_security"></a>

    The advanced security configuration for the repository. See [Advanced Security Configuration](#advanced-security-configuration) below for details.

    Default is `"disabled"`, except if `org_advanced_security` is not true when it is `"enabled"`.

  - [**`secret_scanning`**](#attr-security_and_analysis-secret_scanning): *(**Optional** `string`)*<a name="attr-security_and_analysis-secret_scanning"></a>

    The secret scanning configuration for the repository. See [Secret Scanning Configuration](#secret-scanning-configuration) below for details.

    Default is `"disabled"`.

  - [**`secret_scanning_push_protection`**](#attr-security_and_analysis-secret_scanning_push_protection): *(**Optional** `string`)*<a name="attr-security_and_analysis-secret_scanning_push_protection"></a>

    The secret scanning push protection configuration for the repository. See [Secret Scanning Push Protection Configuration](#secret-scanning-push-protection-configuration) below for details.

    Default is `"disabled"`.

## External Documentation

### Terraform Github Provider Documentation

- https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository
- https://registry.terraform.io/providers/integrations/github/latest/docs/resources/branch
- https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository_collaborator
- https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository_deploy_key
- https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository_ruleset
- https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository_autolink_reference

## Module Versioning

This Module follows the principles of [Semantic Versioning (SemVer)].

Given a version number `MAJOR.MINOR.PATCH`, we increment the:

1. `MAJOR` version when we make incompatible changes,
2. `MINOR` version when we add functionality in a backwards compatible manner, and
3. `PATCH` version when we make backwards compatible bug fixes.

## Reporting Issues

We use GitHub [Issues] to track community reported issues and missing features.

## Contributing

Contributions are always encouraged and welcome! For the process of accepting changes, we use
[Pull Requests]. If you'd like more information, please see our [Contribution Guidelines].

## Attribution

This repository is derived from the
[Mineiros GmbH](https://mineiros.io/?ref=terraform-github-repository) open-source project
[terraform-github-repository](https://github.com/mineiros-io/terraform-github-repository),
licensed under the Apache License 2.0. This fork introduces changes.

## License

[![license][badge-license]][apache20]

This module is licensed under the Apache License Version 2.0, January 2004.
Please see [LICENSE] for full details.

<!-- References -->

[github]: https://github.com/
[`github_repository`]: https://www.terraform.io/docs/providers/github/r/repository.html#attributes-reference
[`github_repository_collaborator`]: https://www.terraform.io/docs/providers/github/r/repository_collaborator.html#attribute-reference
[`github_repository_deploy_key`]: https://www.terraform.io/docs/providers/github/r/repository_deploy_key.html#attributes-reference
[`github_repository_project`]: https://www.terraform.io/docs/providers/github/r/repository_project.html#attributes-reference
[`github_repository_autolink_reference`]: https://www.terraform.io/docs/providers/github/r/repository_autolink_reference.html#attributes-reference
[badge-license]: https://img.shields.io/badge/license-Apache%202.0-brightgreen.svg
[apache20]: https://opensource.org/licenses/Apache-2.0
[terraform]: https://www.terraform.io
[semantic versioning (semver)]: https://semver.org/
[variables.tf]: https://github.com/gaima8/terraform-github-repository/blob/main/variables.tf
[examples/]: https://github.com/gaima8/terraform-github-repository/blob/main/examples
[issues]: https://github.com/gaima8/terraform-github-repository/issues
[license]: https://github.com/gaima8/terraform-github-repository/blob/main/LICENSE
[pull requests]: https://github.com/gaima8/terraform-github-repository/pulls
[contribution guidelines]: https://github.com/gaima8/terraform-github-repository/blob/main/CONTRIBUTING.md
