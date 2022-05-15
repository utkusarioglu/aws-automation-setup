variable "BUDGET_EMAIL" {
  type        = string
  description = "Email address that will be notified for budget issues"
  sensitive   = true
}

variable "REFERER_VALUE" {
  type = string
  description = "Referer value used between cloudfront and s3"
  sensitive = true
}
