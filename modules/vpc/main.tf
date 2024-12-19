data "aws_availability_zones" "available" {}

resource "aws_vpc" "my_vpc_161224" {
  cidr_block = var.cidr_block

  tags = {
    Name      = var.vpc_name
    terraform = true
  }
}


resource "aws_internet_gateway" "igw1" {
  vpc_id = aws_vpc.my_vpc_161224.id

  tags = {
    terraform = true
  }
}

resource "aws_subnet" "priv_sub1" {
  vpc_id            = aws_vpc.my_vpc_161224.id
  cidr_block        = cidrsubnet(var.cidr_block, 8, 1)
  availability_zone = data.aws_availability_zones.available.names[0]

  tags = {
    terraform = true
  }
}

resource "aws_subnet" "pub_sub1" {
  vpc_id            = aws_vpc.my_vpc_161224.id
  cidr_block        = cidrsubnet(var.cidr_block, 8, 2)
  availability_zone = data.aws_availability_zones.available.names[1]

  tags = {
    terraform = true
  }
}


resource "aws_route_table" "rtb1" {
  vpc_id = aws_vpc.my_vpc_161224.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw1.id
  }

  tags = {
    terraform = true
  }
}