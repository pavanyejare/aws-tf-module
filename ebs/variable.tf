variable "availability_zone" {
  description = "The AZ where the EBS volume will exist."
  type        = string
  default     = null
}

variable "tags" {
  description = " tags to assign to the bucket."
  type        = map(string)
  default     = {}
}

variable "size" {
  description = "The size of the drive in GiBs."
  type        = string
  default     = null
}

variable "type" {
  description = "The type of EBS volume. Can be standard, gp2, gp3, io1, io2, sc1 or st1 (Default: gp2)"
  type        = string
  default     = null
}


