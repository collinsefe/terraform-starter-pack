# create an EC2 instance - https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance

resource "aws_instance" "this" {
  ami           = "ami-0fbbcfb8985f9a341"
  count         = 0
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.this.id

  tags = {
    Name = "corighose-ec2-instance"
  }
}
