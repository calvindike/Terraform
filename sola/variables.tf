variable "cidr_block_range" {
  description = "The CIDR block for the VPC"
  default     = "10.1.0.0/16"
}

variable "environment_tag" {
  description = "Our working environment"
  default     = "SRE Interviews"
}

variable "subnet1_cidr_block_range" {
  description = "The CIDR block for public subnet of VPC"
  default     = "10.1.0.0/24"
}

variable "subnet2_cidr_block_range" {
  description = "The CIDR block for private subnet of VPC"
  default     = "10.2.0.0/24"
}
