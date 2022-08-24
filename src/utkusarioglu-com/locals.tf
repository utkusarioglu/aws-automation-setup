locals {
  default_tags = merge(var.inherited_tags, {
    Submodule = "utkusarioglu-com"
  })
  dev_tags = merge(locals.default_tags, {
    Branch = "dev"
  })
  main_tags = merge(locals.default_tags, {
    Branch = "main"
  })
  domain_name = "utkusarioglu.com"
}
