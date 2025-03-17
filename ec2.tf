resource "aws_instance" "web" {
    for_each = {
        vm1 = "t2.micro"
        vm2 = "t2.large"
    }  

    ami = var.ami_id
    instance_type = each.value
    subnet_id = aws_subnet.public.id

    #key_name = "terraform"
    #security_groups = [aws_security_group.web.name]
    
    tags = {
        Name = "WebServer-${each.key}"
        Environment = "sandbox"
        ProjectID = "24356"
    }
}