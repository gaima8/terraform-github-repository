# ---------------------------------------------------------------------------------------------------------------------
# Action Secrets
# ---------------------------------------------------------------------------------------------------------------------

locals {
  plaintext_secrets = { for name, value in var.plaintext_secrets : name => { plaintext = value } }
  encrypted_secrets = { for name, value in var.encrypted_secrets : name => { encrypted = value } }

  secrets = merge(local.plaintext_secrets, local.encrypted_secrets)
}

# Encrypted values must have been encrypted with this key
data "github_actions_public_key" "repository" {
  count = length(var.encrypted_secrets) > 0 ? 1 : 0

  # Referencing the resource defers the read until the repository exists
  repository = github_repository.repository.name
}

resource "github_actions_secret" "repository_secret" {
  for_each = local.secrets

  repository      = github_repository.repository.name
  secret_name     = each.key
  value           = try(each.value.plaintext, null)
  value_encrypted = try(each.value.encrypted, null)
  key_id          = can(each.value.encrypted) ? data.github_actions_public_key.repository[0].key_id : null
}
