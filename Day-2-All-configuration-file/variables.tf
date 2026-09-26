variable "cidr" {
  description = "CIDR block for the vpc"
  type        = string
  default     = "10.0.0.0/16"


}

variable "name_tag" {
  description = "Name tag for the vpc"
  type        = stringy
  default     = "dev-vpc"
}

variable "subnet_cidr" {
  description = "CIDR block for the subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "subnet_tag" {
  description = "Name tag for the subnet"
  type        = string
  default     = "dev-subnet"
}

variable "ami" {
  description = "AMI ID for the ec2 instanc"
  type        = string
  default     = "ami-0fef201115eefe936"

}

variable "instance_type" {
  description = " Instance type for the ec2 instance"
  type        = string
  default     = "t3.micro"

}
