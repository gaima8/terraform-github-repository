# ---------------------------------------------------------------------------------------------------------------------
# SET TERRAFORM AND PROVIDER REQUIREMENTS FOR RUNNING THIS MODULE
# ---------------------------------------------------------------------------------------------------------------------

terraform {
  required_version = "~> 1.3"

  required_providers {
    github = {
      source  = "integrations/github"
      version = ">= 6.2, < 7.0"
    }
  }
}
