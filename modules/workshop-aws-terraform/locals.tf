locals {
  default_tags = merge(var.inherited_tags, {
    Submodule = "workshop-aws-terraform"
  })
}
