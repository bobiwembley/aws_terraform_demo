
variable "region" {
  type    = string
  default = "us-east-1"

}


variable "amis" {
  type = map(any)
  default = {
    "us-east-1" = "ami-00300977ac5b2eb86"
    "us-east-2" = "ami-0bff25b43a4479334"
  }
}

variable "instance_type" {
  type    = string
  default = "t2.micro"

}


variable "vpc_cidr" {
  type    = string
  default = "10.10.0.0/16"
}


variable "subnets_cidr" {
  type    = list(string)
  default = ["10.10.1.0/24", "10.10.2.0/24", "10.10.3.0/24", "10.10.4.0/24"]
}

variable "key_name" {
  description = "Key name of the Key Pair to use for the instance; which can be managed using the `aws_key_pair` resource"
  type        = string
  default     = "cloud"
}


