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