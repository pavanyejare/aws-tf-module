variable "ami" {
  description = "AMI of instance"
  type        = string
  default     = null
}

variable "tags" {
  description = " tags to assign to the bucket."
  type        = map(string)
  default     = {}
}

variable "instance_type" {
  description = "Instance type"
  type        = string
  default     = null
}
variable "zone" {
  description = "availability zones"
  type        = string
  default     = null
}
variable "ssh_key" {
  description = "ssh key name"
  type        = string
  default     = null
}

variable "security_group" {
  description = "security group"
  type        = list(any)
  default     = null
}
variable "subnet" {
  description = "availability zones"
  type        = string
  default     = null
}


