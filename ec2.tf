# create an EC2 instance - https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance

locals {
  server_name = [
    "bob",
    "john",
    "collins"
  ]
}


resource "aws_instance" "collins" {
  ami = "ami-0dfe0f1abee59c78d"
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.this.id
  associate_public_ip_address = true
  key_name                    = aws_key_pair.this.key_name
  user_data                   = file("${path.module}/user-data.sh")

  tags = {
    Name          = "collins-ec2-instance"
    Deployed_from = "Terraform"
  }
}


resource "aws_instance" "bob" {
  ami = "ami-0dfe0f1abee59c78d"
  # count = 0
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.this.id
  associate_public_ip_address = true
  key_name                    = aws_key_pair.this.key_name
  user_data                   = file("${path.module}/user-data.sh")

  tags = {
    Name          = "bob-ec2-instance"
    Deployed_from = "Terraform"
  }
}

resource "aws_instance" "john" {
  ami = "ami-0dfe0f1abee59c78d"
  # count = 0
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.this.id
  associate_public_ip_address = true
  key_name                    = aws_key_pair.this.key_name
  user_data                   = file("${path.module}/user-data.sh")

  tags = {
    Name          = "john-ec2-instance"
    Deployed_from = "Terraform"
  }
}
