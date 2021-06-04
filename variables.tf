variable "aws_region" {
	default = "ap-southeast-1"
}

variable "vpc_cidr" {
	default = "10.20.0.0/16"
}

variable "subnets_cidr" {
	default = "10.20.1.0/24" 
}

variable "azs" {
	default = "ap-southeast-1a"
}

