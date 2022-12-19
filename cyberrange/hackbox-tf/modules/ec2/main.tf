terraform {
  required_providers {
    aws = {
      version = "~> 4.46.0"
    }
  }
}

resource "aws_instance" "this" {
  for_each = var.instance
  ami                                   = try(each.value.ami, null)
  instance_type                         = try(each.value.instance_type, null)
  cpu_core_count                        = try(each.value.cpu_core_count, null)
  cpu_threads_per_core                  = try(each.value.cpu_threads_per_core, null)
  hibernation                           = try(each.value.hibernation, null)
  user_data                             = try(each.value.user_data, null)
  user_data_base64                      = try(each.value.user_data_base64, null)
  user_data_replace_on_change           = try(each.value.user_data_replace_on_change, null)
  availability_zone                     = try(each.value.availability_zone, null)
  subnet_id                             = try(each.value.subnet_id, null)
  vpc_security_group_ids                = try(each.value.vpc_security_group_ids, null)
  key_name                              = try(each.value.key_name, null)
  monitoring                            = try(each.value.monitoring, null)
  get_password_data                     = try(each.value.get_password_data, null)
  iam_instance_profile                  = try(each.value.iam_instance_profile, null)
  associate_public_ip_address           = try(each.value.associate_public_ip_address, null)
  private_ip                            = try(each.value.private_ip, null)
  secondary_private_ips                 = try(each.value.secondary_private_ips, null)
  ipv6_address_count                    = try(each.value.ipv6_address_count, null)
  ipv6_addresses                        = try(each.value.ipv6_addresses, null)
  ebs_optimized                         = try(each.value.ebs_optimized, null)
  source_dest_check                     = try(each.value.network_interface, null) != null ? try(each.value.source_dest_check, null) : null
  disable_api_termination               = try(each.value.disable_api_termination, null)
  disable_api_stop                      = try(each.value.disable_api_stop, null)
  instance_initiated_shutdown_behavior  = try(each.value.instance_initiated_shutdown_behavior, null)
  placement_group                       = try(each.value.placement_group, null)
  tenancy                               = try(each.value.tenancy, null)
  host_id                               = try(each.value.host_id, null)
  tags                                  = merge({ "Name" = try(each.key, null) }, try(each.value.tags, null)) 
  volume_tags                           = try(each.value.volume_tags, null)

  dynamic "capacity_reservation_specification" {
    for_each = try(each.value.capacity_reservation_specification, null) != null ? [each.value.capacity_reservation_specification] : []
    content {
      capacity_reservation_preference = lookup((each.value.capacity_reservation_specification), "capacity_reservation_preference", null)

      dynamic "capacity_reservation_target" {
        for_each = try(each.value.capacity_reservation_target, null) != null ? [each.value.capacity_reservation_target] : []
        content {
          capacity_reservation_id                 = lookup((each.value.capacity_reservation_target), "capacity_reservation_id", null)
          capacity_reservation_resource_group_arn = lookup((each.value.capacity_reservation_target), "capacity_reservation_resource_group_arn", null)
        }
      }
    }
  }

  dynamic "root_block_device" {
    for_each = try(each.value.root_block_device, null) != null ? [each.value.root_block_device] : []
    content {
      delete_on_termination = lookup((each.value.root_block_device), "delete_on_termination", null)
      encrypted             = lookup((each.value.root_block_device), "encrypted", null)
      iops                  = lookup((each.value.root_block_device), "iops", null)
      kms_key_id            = lookup((each.value.root_block_device), "kms_key_id", null)
      volume_size           = lookup((each.value.root_block_device), "volume_size", null)
      volume_type           = lookup((each.value.root_block_device), "volume_type", null)
      throughput            = lookup((each.value.root_block_device), "throughput", null)
    }
  }

  dynamic "ebs_block_device" {
    for_each = try(each.value.ebs_block_device, null) != null ? [each.value.ebs_block_device] : []
    content {
      delete_on_termination = lookup((each.value.ebs_block_device), "delete_on_termination", null)
      device_name           = lookup((each.value.ebs_block_device), "device_name", null)
      encrypted             = lookup((each.value.ebs_block_device), "encrypted", null)
      iops                  = lookup((each.value.ebs_block_device), "iops", null)
      kms_key_id            = lookup((each.value.ebs_block_device), "kms_key_id", null)
      snapshot_id           = lookup((each.value.ebs_block_device), "snapshot_id", null)
      volume_size           = lookup((each.value.ebs_block_device), "volume_size", null)
      volume_type           = lookup((each.value.ebs_block_device), "volume_type", null)
      throughput            = lookup((each.value.ebs_block_device), "throughput", null)
    }
  }

  dynamic "ephemeral_block_device" {
    for_each = try(each.value.ephemeral_block_device, null) != null ? [each.value.ephemeral_block_device] : []
    content {
      device_name  = lookup((each.value.ephemeral_block_device), "device_name", null)
      no_device    = lookup((each.value.ephemeral_block_device), "no_device", null)
      virtual_name = lookup((each.value.ephemeral_block_device), "virtual_name", null)
    }
  }

  dynamic "metadata_options" {
    for_each = try(each.value.metadata_options, null) != null ? [each.value.metadata_options] : []
    content {
      http_endpoint               = lookup((each.value.metadata_options), "http_endpoint", null)
      http_tokens                 = lookup((each.value.metadata_options), "http_tokens", null)
      http_put_response_hop_limit = lookup((each.value.metadata_options), "http_put_response_hop_limit", null)
      instance_metadata_tags      = lookup((each.value.metadata_options), "instance_metadata_tags", null)
    }
  }

  dynamic "network_interface" {
    for_each = try(each.value.network_interface, null) != null ? [each.value.network_interface] : []
    content {
      device_index          = lookup((each.value.network_interface), "device_index", null)
      network_interface_id  = lookup((each.value.network_interface), "network_interface_id", null)
      delete_on_termination = lookup((each.value.network_interface), "delete_on_termination", null)
    }
  }

  dynamic "launch_template" {
    for_each = try(each.value.launch_template, null) != null ? [each.value.launch_template] : []
    content {
      id      = lookup((each.value.launch_template), "id", null)
      name    = lookup((each.value.launch_template), "name", null)
      version = lookup((each.value.launch_template), "version", null)
    }
  }

  enclave_options {
    enabled = try(each.value.enclave_options_enabled, null)
  }

  credit_specification {
    cpu_credits = replace(try(each.value.instance_type, null), "/^t(2|3|3a){1}\\..*$/", "1") == "1" ? try(each.value.cpu_credits, null) : null
  }

  timeouts {
    create = try(each.value.create, null)
    update = try(each.value.update, null)
    delete = try(each.value.delete, null)
  }
}