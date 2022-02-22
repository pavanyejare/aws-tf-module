variable "bucket-name" {
  description = "The name of the bucket. it should be wafd-<account>-<region>-<purpose> (e.g wafd-prod-usw2-alblog)."
  type        = string
  default     = null
}

variable "tags" {
  description = " tags to assign to the bucket."
  type        = map(string)
  default     = {}
}

#variable "region" {
#  description = "region name for bucket"
#  type        = string
# default     = "us-east-1"
#}

