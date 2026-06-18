# ----------------------------------------------------------------------------------------------------------------------
# OUTPUT CALCULATED VARIABLES (prefer full objects)
# ----------------------------------------------------------------------------------------------------------------------

output "full_name" {
  value       = github_repository.repository.full_name
  description = "A string of the form 'orgname/reponame'."
}

output "html_url" {
  value       = github_repository.repository.html_url
  description = "URL to the repository on the web."
}

output "ssh_clone_url" {
  value       = github_repository.repository.ssh_clone_url
  description = "URL that can be provided to git clone to clone the repository via SSH."
}

output "http_clone_url" {
  value       = github_repository.repository.http_clone_url
  description = "URL that can be provided to git clone to clone the repository via HTTPS."
}

output "git_clone_url" {
  value       = github_repository.repository.git_clone_url
  description = "URL that can be provided to git clone to clone the repository anonymously via the git protocol."
}

# ----------------------------------------------------------------------------------------------------------------------
# OUTPUT ALL RESOURCES AS FULL OBJECTS
# ----------------------------------------------------------------------------------------------------------------------

output "repository" {
  value = {
    id                          = github_repository.repository.id
    node_id                     = github_repository.repository.node_id
    repo_id                     = github_repository.repository.repo_id
    name                        = github_repository.repository.name
    full_name                   = github_repository.repository.full_name
    description                 = github_repository.repository.description
    visibility                  = github_repository.repository.visibility
    homepage_url                = github_repository.repository.homepage_url
    html_url                    = github_repository.repository.html_url
    ssh_clone_url               = github_repository.repository.ssh_clone_url
    http_clone_url              = github_repository.repository.http_clone_url
    git_clone_url               = github_repository.repository.git_clone_url
    svn_url                     = github_repository.repository.svn_url
    primary_language            = github_repository.repository.primary_language
    has_issues                  = github_repository.repository.has_issues
    has_wiki                    = github_repository.repository.has_wiki
    is_template                 = github_repository.repository.is_template
    allow_merge_commit          = github_repository.repository.allow_merge_commit
    allow_rebase_merge          = github_repository.repository.allow_rebase_merge
    allow_squash_merge          = github_repository.repository.allow_squash_merge
    allow_update_branch         = github_repository.repository.allow_update_branch
    allow_auto_merge            = github_repository.repository.allow_auto_merge
    delete_branch_on_merge      = github_repository.repository.delete_branch_on_merge
    auto_init                   = github_repository.repository.auto_init
    gitignore_template          = github_repository.repository.gitignore_template
    license_template            = github_repository.repository.license_template
    archived                    = github_repository.repository.archived
    archive_on_destroy          = github_repository.repository.archive_on_destroy
    topics                      = github_repository.repository.topics
    web_commit_signoff_required = github_repository.repository.web_commit_signoff_required
    squash_merge_commit_title   = github_repository.repository.squash_merge_commit_title
    squash_merge_commit_message = github_repository.repository.squash_merge_commit_message
    merge_commit_title          = github_repository.repository.merge_commit_title
    merge_commit_message        = github_repository.repository.merge_commit_message
    pages                       = github_repository.repository.pages
    security_and_analysis       = github_repository.repository.security_and_analysis
    template                    = github_repository.repository.template
  }
  description = "Non-deprecated attributes of the github_repository resource."
}

output "branches" {
  value       = github_branch.branch
  description = "A map of branch objects keyed by branch name."
}

output "collaborators" {
  value       = github_repository_collaborator.collaborator
  description = "A map of collaborator objects keyed by collaborator.name."
}

output "issue_labels" {
  value       = github_issue_label.label
  description = "A map of issue labels keyed by label input id or name."
}

locals {
  deploy_keys_output = merge({
    for i, d in github_repository_deploy_key.deploy_key_computed :
    lookup(local.deploy_keys_computed_temp[i], "id", md5(d.key)) => d
  }, github_repository_deploy_key.deploy_key)
}

output "deploy_keys" {
  value       = local.deploy_keys_output
  description = "A map of deploy keys keyed by input id."
}

output "webhooks" {
  value       = github_repository_webhook.repository_webhook
  sensitive   = true
  description = "All attributes and arguments as returned by the github_repository_webhook resource."
}

output "secrets" {
  value       = [for secret in github_actions_secret.repository_secret : secret.secret_name]
  description = "List of secrets available."
}

output "app_installations" {
  value       = github_app_installation_repository.app_installation_repository
  description = "A map of deploy app installations keyed by installation id."
}

# ----------------------------------------------------------------------------------------------------------------------
# OUTPUT MODULE CONFIGURATION
# ----------------------------------------------------------------------------------------------------------------------
