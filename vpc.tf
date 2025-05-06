# reate a VPC - https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc
resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "corighose-vpc"
  }
}

resource "aws_subnet" "this" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.0.0/18"
  map_public_ip_on_launch = true
  availability_zone       = "eu-west-2a"
  depends_on              = [aws_internet_gateway.gw]
}

resource "aws_subnet" "that" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.64.0/18"
  map_public_ip_on_launch = true
  availability_zone       = "eu-west-2b"
  depends_on              = [aws_internet_gateway.gw]
}

# next 2 AZs cidr_block will be 
# 10.0.128.0/18
# 10.0.192.0/18


resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id
}


# Create a Route Table for Public Subnet
resource "aws_route_table" "this" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "this-public-route-table"
  }
}

# Associate the Route Table with the Public Subnet
resource "aws_route_table_association" "this" {
  subnet_id      = aws_subnet.this.id
  route_table_id = aws_route_table.this.id
}


# Create a Route Table for Public Subnet
resource "aws_route_table" "that" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "that-public-route-table"
  }
}

# Associate the Route Table with the Public Subnet
resource "aws_route_table_association" "that" {
  subnet_id      = aws_subnet.that.id
  route_table_id = aws_route_table.that.id
}




