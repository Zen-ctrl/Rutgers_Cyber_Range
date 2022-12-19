variable "alarm" {
  description = "Map value details for CloudWatch alarm creation"
  type = any
  default = {}
}

variable "metric" {
  description = "Map value details for CloudWatch metric creation"
  type = any
  default = {}
}

variable "log_group" {
  description = "Map value details for CloudWatch log group creation"
  type = any
  default = {}
}