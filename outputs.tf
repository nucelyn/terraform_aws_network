output "vpc_id" {
  value = aws_vpc.terraform.id
}

output "vpc_arn" {
  value = aws_vpc.terraform.arn
}

output "dhcp_options_id" {
  value = aws_vpc.terraform.dhcp_options_id
}