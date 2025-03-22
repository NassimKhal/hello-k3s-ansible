# AWS Region
variable "aws_region" {
  description = "AWS region for deploying infrastructure"
  type        = string
  default     = "us-east-1" # Paris region (Free Tier)
}

# EC2 instance type
variable "instance_type" {
  description = "EC2 instance type (Free Tier eligible)"
  type        = string
  default     = "t2.micro"
}

variable "ssh_public_key" {
  description = "Public SSH key for EC2 instance"
  type        = string
}