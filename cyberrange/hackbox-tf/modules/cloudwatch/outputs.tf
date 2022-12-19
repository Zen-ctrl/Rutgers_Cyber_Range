output "cloudwatch_metric_alarm_arn" {
  description = "The ARN of the Cloudwatch metric alarm."
  value       = try(aws_cloudwatch_metric_alarm.this[0].arn, "")
}

output "cloudwatch_metric_alarm_id" {
  description = "The ID of the Cloudwatch metric alarm."
  value       = try(aws_cloudwatch_metric_alarm.this[0].id, "")
}

output "cloudwatch_log_metric_filter_id" {
  description = "The name of the metric filter"
  value       = try(aws_cloudwatch_log_metric_filter.this[0].id, "")
}

output "cloudwatch_log_group_name" {
  description = "Name of Cloudwatch log group"
  value       = try(aws_cloudwatch_log_group.this[0].name, "")
}

output "cloudwatch_log_group_arn" {
  description = "ARN of Cloudwatch log group"
  value       = try(aws_cloudwatch_log_group.this[0].arn, "")
}