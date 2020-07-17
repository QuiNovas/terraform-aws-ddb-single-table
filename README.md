# terraform-aws-ddb-single-table

This module creates a DynamoDB table with single table design. This is an extension of standard table (https://github.com/QuiNovas/terraform-aws-dynamodb-table)

## Note
It enforces these characteristics
* Partition Key is set as `PK` and Range Key is set as `SK`
* GSI's and LSI's can be added
* GSI's Partition Key will be named as `GSIxPK` (where x is the number of the GSI) and can have optional sort key that will be named `GSIxSK`
* LSI's range key will be named `LSIxSK` (where x is the number of the LSI)
* Indices will named as `GSIx` and `LSIx` 
* `projection_type` is always `INCLUDE`, so `projection_attributes` must be passed.

## Example Usage
```hcl
module "single_table" {
  name         = "single-table"
  billing_mode = "PAY_PER_REQUEST"

  gsi = [
    {
      projection_attributes = ["test"]
      range_key             = true
    },
    {
      projection_attributes = ["test1"]
      range_key             = false
    }

  ]

  lsi = [
    {
      projection_attributes = ["test1"]
    }
  ]

  source       = "Quinovas/terraform-aws-ddb-single-table/aws"
}

output "gsi_names" {
  description = "gsi names"
  value       = module.single_table.gsi_names
}

output "lsi_names" {
  description = "lsi names"
  value       = module.single_table.lsi_names
}

```
## Outputs after apply
```
gsi_names = [
  "GSI0",
  "GSI1",
]
lsi_names = [
  "LSI0",
]
```

## Authors

Module managed by Quinovas (https://github.com/QuiNovas)

## License

Apache License, Version 2.0, January 2004 (http://www.apache.org/licenses/). See LICENSE for full details.

