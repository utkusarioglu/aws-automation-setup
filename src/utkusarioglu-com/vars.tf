variable "inherited_tags" {
  type        = map(any)
  description = "Tags that are handed down by the parent module"
}

variable "github_oidc_arn" {
  type        = string
  description = "Github OpenID Connect ARN"
}

variable "referer_value" {
  type = string
  description = "Referer value used between cloudfront and s3"
  sensitive = true
}
