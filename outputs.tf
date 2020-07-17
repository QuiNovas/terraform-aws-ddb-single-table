output "fixed_attributes" {
  description = "standard attributes"
  value       = local.fixed_attributes
}

output "built_attributes" {

  description = "supplied attributes"
  value       = local.built_attributes
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