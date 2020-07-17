locals {
  fixed_attributes = [
    {
      name = "PK"
      type = "S"
    },
    {
      name = "SK"
      type = "S"
    }
  ]

  built_gsi_attributes = [
    for item in var.gsi :
    [
      lookup(item, "range_key", false) ? [{
        "name" = join("", ["GSI", index(var.gsi, item), "PK"]),
        "type" = "S"
        },
        {
          "name" = join("", ["GSI", index(var.gsi, item), "SK"]),
          "type" = "S"
        }
        ] : [{
          "name" = join("", ["GSI", index(var.gsi, item), "PK"]),
          "type" = "S"
      }]
    ]
  ]

  built_lsi_attributes = [
    for item in var.lsi :
    {
      "name" = join("", ["LSI", index(var.lsi, item), "SK"]),
      "type" = "S"
    }
  ]

  attributes = flatten(concat(local.fixed_attributes, concat(local.built_gsi_attributes, local.built_lsi_attributes)))

  global_secondary_index = [
    for item in var.gsi :
    {
      "name"               = join("", ["GSI", index(var.gsi, item)]),       ## GSIx
      "hash_key"           = join("", ["GSI", index(var.gsi, item), "PK"]), ## GSIxPK
      "non_key_attributes" = lookup(item, "projection_attributes", null),
      "projection_type"    = "INCLUDE",
      "range_key"          = lookup(item, "range_key", false) ? join("", ["GSI", index(var.gsi, item), "SK"]) : null,
      "read_capacity"      = lookup(item, "read_capacity", null),
      "write_capacity"     = lookup(item, "write_capacity", null)
    }
  ]

  local_secondary_index = [
    for item in var.lsi :
    {
      "name"               = join("", ["LSI", index(var.lsi, item)]),       ## LSIx
      "range_key"          = join("", ["LSI", index(var.lsi, item), "SK"]), ## LSIxSK
      "non_key_attributes" = lookup(item, "projection_attributes", null),
      "projection_type"    = "INCLUDE",
      "read_capacity"      = lookup(item, "read_capacity", null),
      "write_capacity"     = lookup(item, "write_capacity", null)
    }
  ]

  gsi_names = [
    for item in var.gsi :
    join("", ["GSI", index(var.gsi, item)])
  ]

  lsi_names = [
    for item in var.lsi :
    join("", ["LSI", index(var.lsi, item)])
  ]
}
