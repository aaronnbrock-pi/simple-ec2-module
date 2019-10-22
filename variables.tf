variable "ec2_name" {
  description = "What to name the EC2 instance."
  type        = string
  default     = "Simple Instance"
}

variable "ec2_type" {
  description = "What type of EC2 instance to create."
  type        = string
  default     = "t2.micro"
}