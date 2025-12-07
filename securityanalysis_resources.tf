locals {
  security_and_analysis = var.security_and_analysis != null ? var.security_and_analysis : {
    org_advanced_security                 = false
    advanced_security                     = "disabled"
    code_security                         = "disabled"
    secret_scanning                       = "disabled"
    secret_scanning_push_protection       = "disabled"
    secret_scanning_ai_detection          = "disabled"
    secret_scanning_non_provider_patterns = "disabled"
  }

  saa_child_enabled = (
    local.security_and_analysis.code_security == "enabled" ||
    local.security_and_analysis.secret_scanning == "enabled" ||
    local.security_and_analysis.secret_scanning_push_protection == "enabled" ||
    local.security_and_analysis.secret_scanning_ai_detection == "enabled" ||
    local.security_and_analysis.secret_scanning_non_provider_patterns == "enabled"
  )

  advanced_security_status = (
    local.saa_child_enabled || local.security_and_analysis.advanced_security == "enabled"
  ) ? "enabled" : "disabled"
}
