variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC"
  type = string
}

variable "vpc_instance_tenancy" {
  description = "The tenancy options for instances launched into the VPC"
  type = string
}  

variable "vpc_tags" {
  description = "A map of tags to add to the VPC"
  type = map(any)
  }  

variable "pubsubnet_cidr_block" {
    description = "The CIDR block for the public subnet"
    type = string
    }

variable "privsubnet_cidr_block" {
    description = "The CIDR block for the private subnet"
    type = string
    }

variable "pubrt_cidr_block" {
    description = "The CIDR block for the public route table"
    type = string      
}   

variable "privrt_cidr_block" {
    description = "The CIDR block for the private route table"
    type = string      
}
