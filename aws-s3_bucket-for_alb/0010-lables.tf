module "s3_bucket-for_alb" {
  source    = "git::https://github.com/MagentoLevels/terraform-modules.git//tf-label?ref=tags/v0.0.3"
  namespace = var.namespace
  name      = var.name
  stage     = var.stage
  delimiter = var.delimiter
  tags      = var.tags
  enabled   = var.enabled
}
