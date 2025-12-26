variable "ec2_instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "ec2_default_root_storage_size" {
  default = 10
  type    = number
}
variable "ec2_ami_id" {
  default = "ami-0f5fcdfbd140e4ab7"
  type    = string
}
variable "env" {
  description = "Dev environment"
  type        = string
  default     = "dev"
}