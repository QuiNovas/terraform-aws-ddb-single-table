module "single_table" {
  attribute = local.attributes

  billing_mode = var.billing_mode

  global_secondary_index = local.global_secondary_index
  local_secondary_index  = local.local_secondary_index

  autoscaling_service_role_arn = var.autoscaling_service_role_arn
  glue_crawler                 = var.glue_crawler
  point_in_time_recovery       = var.point_in_time_recovery
  stream_view_type             = var.stream_view_type
  tags                         = var.tags
  ttl_attribute_name           = var.ttl_attribute_name

  read_capacity  = var.read_capacity
  write_capacity = var.write_capacity

  hash_key  = "PK"
  range_key = "SK"

  name = var.name

  source  = "QuiNovas/dynamodb-table/aws"
  version = "3.0.5"
}
