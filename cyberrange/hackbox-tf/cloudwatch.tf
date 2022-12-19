module "cloudwatch" {
  source  = "./modules/cloudwatch"
  log_group = {
    hackerbox-live-logs = {
      retention_in_days = 30
      tags              = local.common_tags
    }
  }
}