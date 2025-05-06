# create an EC2 instance - https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance

resource "aws_instance" "this" {
  ami = "ami-0fbbcfb8985f9a341"
  # count         = 1
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.this.id
  associate_public_ip_address = true
  key_name                    = aws_key_pair.this.key_name


  tags = {
    Name          = "collins-ec2-instance"
    Deployed_from = "Terraform"
  }
}
