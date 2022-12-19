terraform {
  required_providers {
    aws = {
      version = "~> 4.46.0"
    }
  }
}


resource "aws_cloudwatch_metric_alarm" "this" {
  for_each                               = var.alarm
  alarm_name                             = try(each.key, null)
  alarm_description                      = try(each.value.alarm_description, null)
  actions_enabled                        = try(each.value.actions_enabled, null)
  alarm_actions                          = try(each.value.alarm_actions, null)
  ok_actions                             = try(each.value.ok_actions, null)
  insufficient_data_actions              = try(each.value.insufficient_data_actions, null)
  comparison_operator                    = try(each.value.comparison_operator, null)
  evaluation_periods                     = try(each.value.evaluation_periods, null)
  threshold                              = try(each.value.threshold, null)
  unit                                   = try(each.value.unit, null)
  datapoints_to_alarm                    = try(each.value.datapoints_to_alarm, null)
  treat_missing_data                     = try(each.value.treat_missing_data, null)
  evaluate_low_sample_count_percentiles  = try(each.value.evaluate_low_sample_count_percentiles, null)
  metric_name                            = try(each.value.metric_name, null)
  namespace                              = try(each.value.namespace, null)
  period                                 = try(each.value.period, null)
  statistic                              = try(each.value.statistic, null)
  extended_statistic                     = try(each.value.extended_statistic, null)
  dimensions                             = try(each.value.dimensions, null)
  threshold_metric_id                    = try(each.value.threshold_metric_id, null)
  tags                                   = try(each.value.tags, null)
}

resource "aws_cloudwatch_log_metric_filter" "this" {
  for_each             = var.metric
  name                 = try(each.key, null)
  pattern              = try(each.value.pattern, null)
  log_group_name       = try(each.value.log_group_name, null)
  metric_transformation {
    name               = try(each.value.metric_transformation_name, null)
    namespace          = try(each.value.metric_transformation_namespace, null)
    value              = try(each.value.metric_transformation_value, null)
    default_value      = try(each.value.metric_transformation_default_value, null)
  }
}

resource "aws_cloudwatch_log_group" "this" {
  for_each             = var.log_group
  name                 = try(each.key, null)
  name_prefix          = try(each.value.name_prefix, null)
  retention_in_days    = try(each.value.retention_in_days, null)
  kms_key_id           = try(each.value.kms_key_id, null)
  tags                 = try(each.value.tags, null)
}