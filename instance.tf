resource "aws_instance" "terraforminstance" {
 ami = "ami-055147723b7bca09a"
 instance_type = "t2.micro"
 subnet_id = "subnet-08fbb7c8727750762"
 key_name = "vardhinising"
 tags= {
    Name = "vardhini-docker"
}
}

