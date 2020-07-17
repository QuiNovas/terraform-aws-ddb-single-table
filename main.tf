module "single_table" {
  attribute = local.attributes
  billing_mode = var.billing_mode

  global_secondary_index = local.global_secondary_index
  local_secondary_index  = local.local_secondary_index

  hash_key               = "PK"
  range_key              = "SK"
  name                   = var.name
  point_in_time_recovery = true

  source  = "QuiNovas/dynamodb-table/aws"
  version = "3.0.5"
}
