# terraform-aws-ddb-single-table

This module creates a DynamoDB table with single table design. This is a extension of standard table (https://github.com/QuiNovas/terraform-aws-dynamodb-table)

## Note
It enforces these characteristics
* Partition Key is set as `PK` and Range Key is set as `SK`
* GSIs and LSIs can be added
* GSI's Partition Key will be named as `GSIxPK` (where x is the number GSI) and can have optional sort key that will be named `GSIxSK`
* LSI's range key will be named as `LSIxSK` (where x is the number of the LSI)
* Indices will named as `GSIx` and `LSIx` 
* `projection_type` is always `INCLUDE`, so `projection_attributes` must be passed.


## Authors

Module managed by Quinovas (https://github.com/QuiNovas)

## License

Apache License, Version 2.0, January 2004 (http://www.apache.org/licenses/). See LICENSE for full details.