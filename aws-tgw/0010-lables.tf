module "default_label" {
  source     = "git::https://github.com/MagentoLevels/terraform-modules.git//tf-label?ref=tags/v0.0.3"
  attributes = var.attributes
  delimiter  = var.delimiter
  name       = var.name
  namespace  = var.namespace
  stage      = var.stage
  tags       = var.tags
}
