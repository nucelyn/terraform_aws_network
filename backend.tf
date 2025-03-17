terraform {
  backend "s3" {
    bucket = "terraform-remote-effulgence-statefile"
    key = "networking/terraform.tfstate"
    region = "us-west-2"
    encrypt = true
    dynamodb_table ="terraform_aws_networking_state_lock"
   
  }
}