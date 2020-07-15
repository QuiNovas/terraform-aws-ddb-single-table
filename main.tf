resource "aws_dynamodb_table" "single_table" {
  dynamic "attribute" {
    for_each = var.attribute
    content {
      name = attribute.value.name
      type = attribute.value.type
    }
  }
  name      = var.name
  hash_key  = "PK"
  range_key = "SK"

  billing_mode = var.billing_mode

  dynamic "global_secondary_index" {
    for_each = var.global_secondary_index
    content {
      hash_key           = global_secondary_index.value.hash_key
      name               = global_secondary_index.value.name
      non_key_attributes = lookup(global_secondary_index.value, "non_key_attributes", null)
      projection_type    = global_secondary_index.value.projection_type
      range_key          = lookup(global_secondary_index.value, "range_key", null)
      read_capacity      = lookup(global_secondary_index.value, "read_capacity", null)
      write_capacity     = lookup(global_secondary_index.value, "write_capacity", null)
    }
  }

  lifecycle {
    ignore_changes = [
      read_capacity,
      write_capacity,
      ttl
    ]
    prevent_destroy = false
  }

  dynamic "local_secondary_index" {
    for_each = var.local_secondary_index
    content {
      name               = local_secondary_index.value.name
      non_key_attributes = lookup(local_secondary_index.value, "non_key_attributes", null)
      projection_type    = local_secondary_index.value.projection_type
      range_key          = local_secondary_index.value.range_key
    }
  }

  point_in_time_recovery {
    enabled = var.point_in_time_recovery
  }

  read_capacity = var.billing_mode == "PROVISIONED" ? var.read_capacity["min"] : null

  server_side_encryption {
    enabled = true
  }

  stream_enabled   = length(var.stream_view_type) > 0 ? true : false
  stream_view_type = var.stream_view_type
  tags             = local.tags
  ttl {
    attribute_name = var.ttl_attribute_name
    enabled        = length(var.ttl_attribute_name) > 0 ? true : false
  }
  write_capacity = var.billing_mode == "PROVISIONED" ? var.write_capacity["min"] : null
}