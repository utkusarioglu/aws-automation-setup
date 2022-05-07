locals {
  default_tags = merge(var.inherited_tags, {
    Submodule = "utkusarioglu-com"
  })
  domain_name = "utkusarioglu.com"
}
