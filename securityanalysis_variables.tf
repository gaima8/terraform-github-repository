variable "security_and_analysis" {
  description = <<EOF
(Optional) Security and analysis configuration for the repository.

- All fields except org_advanced_security are strings: "enabled" or "disabled".
- org_advanced_security is a bool indicating whether the org has split licensing for Advanced Security.
EOF
  type = object({
    org_advanced_security                 = optional(bool, false)
    advanced_security                     = optional(string, "disabled")
    code_security                         = optional(string, "disabled")
    secret_scanning                       = optional(string, "disabled")
    secret_scanning_push_protection       = optional(string, "disabled")
    secret_scanning_ai_detection          = optional(string, "disabled")
    secret_scanning_non_provider_patterns = optional(string, "disabled")
  })

  default = null

  validation {
    condition = (
      alltrue([
        for key, value in(
          var.security_and_analysis != null ? var.security_and_analysis : {}
        ) :
        # Only validate string fields
        key != "org_advanced_security" ? contains(["enabled", "disabled"], value) : true
      ])
    )
    error_message = "All security_and_analysis string fields must be 'enabled' or 'disabled'."
  }
}
