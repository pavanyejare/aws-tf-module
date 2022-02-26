variable "alb_name" {}
variable "alb_sg" {}
variable "subent" { type = list(any) }
variable "tag" {}
variable "port" {}
variable "protocol" {}
variable "target_group_name" {}
variable "target_port" {}
variable "target_protocol" {}
variable "vpc_id" {}


