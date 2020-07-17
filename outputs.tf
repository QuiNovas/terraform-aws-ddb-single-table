output "arn" {
  description = "The arn of the single design table"
  value       = module.single_table.arn
}

output "gsi_names" {
  description = "List of GSI names that got created"
  value       = local.gsi_names
}

output "lsi_names" {
  description = "List of LSI names that got created"
  value       = local.lsi_names
}

output "hash_key" {
  description = "The attribute to use as the hash (partition) key."
  value       = module.single_table.hash_key
}

output "name" {
  description = "The name of the table."
  value       = module.single_table.name
}

output "stream_arn" {
  description = "The ARN of the Table Stream. Only available if stream_view_type is set."
  value       = module.single_table.stream_arn
}


## testing attributes
output "fixed_attributes" {
  description = "standard attributes"
  value       = local.fixed_attributes
}

output "built_gsi_attributes" {
  description = "supplied gsi attributes"
  value       = local.built_gsi_attributes
}

output "built_lsi_attributes" {
  description = "supplied lsi attributes"
  value       = local.built_lsi_attributes
}

output "combined_flatten_list" {
  description = "flatten attributes"
  value       = local.attributes
}

output "gsi_list" {
  description = "gsi list"
  value       = local.global_secondary_index
}

output "lsi_list" {
  description = "lsi list"
  value       = local.local_secondary_index
}
