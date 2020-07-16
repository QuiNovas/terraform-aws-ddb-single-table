module "single_table" {
  attribute = [
    {
      name = "PK"
      type = "S"
    },
    {
      name = "SK"
      type = "S"
    },
  ]
  hash_key                = "PK"
  range_key               = "SK"
  name                    = var.name
  point_in_time_recovery  = true
  source                  = "QuiNovas/dynamodb-table/aws"
  version                 = "3.0.5"
}