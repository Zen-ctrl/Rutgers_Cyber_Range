# This is runtime variable setting which is used for complex variable validation and settings
# In this case, its a variable with mapping. This is used for resource tagging.
# These values are used all over the deployment. Any reosurce which has tagging capabilites will have these tags integrated aloing with some other custom tags
locals {
  common_tags = {
    "Environment"      = var.env
    "Owner"            = var.Owner
    "Project"          = upper(var.Project)
  }
}