resource "aws_vpc" "terraform" {
  cidr_block = var.vpc_cidr_block
  instance_tenancy = var.vpc_instance_tenancy
  tags = var.vpc_tags  
  }

  #creating the IGW
  #Google: terraform aws internet gateway
  resource "aws_internet_gateway" "gw" {
    vpc_id = aws_vpc.terraform.id
    tags = var.vpc_tags
    }
    
  resource "aws_subnet" "public" {
    vpc_id = aws_vpc.terraform.id
    cidr_block = var.pubsubnet_cidr_block

    tags = merge(var.vpc_tags, { Name = "Public_Subnet" })
    }
    
  resource "aws_subnet" "private" {
    vpc_id = aws_vpc.terraform.id
    cidr_block = var.privsubnet_cidr_block

    tags = var.vpc_tags
    tags = merge(var.vpc_tags, { Name = "Private_Subnet" })
    
  #creating the route table
  resource "aws_route_table" "public" {
    vpc_id = aws_vpc.terraform.id
    route {
      cidr_block = var.pubrt_cidr_block
      gateway_id = aws_internet_gateway.gw.id
    }
    tags = merge(var.vpc_tags, { Name = "PubSNRT" })
    } 
  
  resource "aws_route_table" "private" {
    vpc_id = aws_vpc.terraform.id
    tags = merge(var.vpc_tags, { Name = "PrivSNRT" })
    }

  #associating the route table with the subnet
  resource "aws_route_table_association" "public" {
    subnet_id = aws_subnet.public.id
    route_table_id = aws_route_table.public_rt.id
    }

  resource "aws_route_table_association" "private" {
    subnet_id = aws_subnet.private.id
    route_table_id = aws_route_table.private_rt.id
    }

  resource "aws_nat_gateway" "eip" {
    allocation_id = aws_eip.nat.id
    subnet_id = aws_subnet.public.id
    tags = var.vpc_tags
       name = "NATGW"
    tags = merge(var.vpc_tags, { Name = "NATGW" })
    }

  resource "aws_eip" "eip" {
    vpc = true
    tags = var.vpc_tags
    }


    
  

