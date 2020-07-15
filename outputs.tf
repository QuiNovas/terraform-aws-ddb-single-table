output "arn" {
  description = "The arn of the table"
  value       = aws_dynamodb_table.single_table.arn
}


output "name" {
  description = "The name of the table."
  value       = aws_dynamodb_table.single_table.name
}

output "stream_arn" {
  description = "The ARN of the Table Stream. Only available if stream_view_type is set."
  value       = aws_dynamodb_table.single_table.stream_enabled == true ? aws_dynamodb_table.single_table.stream_arn : ""
}

