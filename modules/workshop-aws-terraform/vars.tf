variable "inherited_tags" {
  type        = map(any)
  description = "Tags that are handed down by the parent module"
}

variable "github_oidc_arn" {
  type        = string
  description = "Github OpenID Connect ARN"
}
