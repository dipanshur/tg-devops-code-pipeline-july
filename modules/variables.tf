variable "vpc_cidr" {
    type        = string
    description = "The CIDR block for the VPC"
  
}

variable "isPrivateSubnetNeeded" {
    type = bool
    description = "set to create private subnet allowed values are true or false"
  
}

variable "vpc_instance_tenency" {
    type        = string
    description = "The tenancy of the VPC"
    default = "default"
  
}

variable "batch_code" {
    type        = string
    description = "The batch code for the VPC"  
}

variable "batch_mode" {
    type        = string
    description = "Please mention it is weekday or weekend"
  
}

variable "batch_month" {
    type        = string
    description = "Please mention the month of the batch"
  
}

variable "provisioned_by" {
    type        = string
    description = "Engineer who is creating this resource"
  
}

variable "public_subnet_cidr" {
    type        = string
    description = "The CIDR block for the public subnet"
  
}

variable "private_subnet_cidr" {
    type        = string
    description = "The CIDR block for the private subnet"
  
}

variable "public_subnet_az" {
    type        = string
    description = "The Availability Zone for the public subnet"
  
}

variable "private_subnet_az" {
    type        = string
    description = "The Availability Zone for the private subnet"
  
}


variable "ec2_attributes" {
    description = "define ec2 attributes"

    type = map(object({
        ami = string
        instance_type = string
        key_name = string
        tags = map(string)
    }))
  
}

variable "sg_ingress" {
    type = list(object({
        from_port = number
        to_port   = number
        protocol = string
        cidr_blocks = list(string)
    }))
  
}

variable "sg_egress" {
    type = list(object({
        from_port = number
        to_port   = number
        protocol = string
        cidr_blocks = list(string)
    }))
  
}

