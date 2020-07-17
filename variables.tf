variable "autoscaling_service_role_arn" {
  default     = ""
  description = "The ARN of the IAM role that allows Application AutoScaling to modify your scalable target on your behalf. Required if billing_mode is PROVISIONED."
  type        = string
}

variable "billing_mode" {
  default     = "PROVISIONED"
  description = "Controls how you are charged for read and write throughput and how you manage capacity. The valid values are PROVISIONED and PAY_PER_REQUEST."
  type        = string
}

variable "glue_crawler" {
  default     = {}
  description = "If present, glue crawler is created to crawl the table. Should consist of database_name, schedule (cron expression) and description(can be null)"
  type        = map(string)
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

variable "point_in_time_recovery" {
  default = false
  type    = bool
}

variable "read_capacity" {
  default = {
    max = 1
    min = 1
  }
  description = "The number of read units for this table, expressed as min and max."
  type        = map(number)
}

variable "stream_view_type" {
  default     = ""
  description = "When an item in the table is modified, StreamViewType determines what information is written to the table's stream. Valid values are KEYS_ONLY, NEW_IMAGE, OLD_IMAGE, NEW_AND_OLD_IMAGES."
  type        = string
}

variable "tags" {
  default     = {}
  description = "A map of tags to populate on the created table."
  type        = map(string)
}

variable "ttl_attribute_name" {
  default     = ""
  description = "The name of the table attribute to store the TTL timestamp in."
  type        = string
}

variable "write_capacity" {
  default = {
    max = 1
    min = 1
  }
  description = "The number of write units for this table, expressed as min and max."
  type        = map(number)
}
