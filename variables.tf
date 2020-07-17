variable "billing_mode" {
  default     = "PROVISIONED"
  description = "Controls how you are charged for read and write throughput and how you manage capacity. The valid values are PROVISIONED and PAY_PER_REQUEST."
  type        = string
}

variable "name" {
  description = "The name of the table, this needs to be unique within a region."
  type        = string
}

variable "gsi" {
  default     = []
  description = "List of GSI's"
  type = list(object({
    projection_attributes = list(string)
    range_key             = string

  }))
}

variable "lsi" {
  default     = []
  description = "List of LSI's"
  type = list(object({
    projection_attributes = list(string)
  }))
}

#  read_capacity      = number
# write_capacity     = number