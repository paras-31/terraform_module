resource "aws_vpc" "main" {
  cidr_block       = var.cidr[0]
  instance_tenancy = "default"

  tags = {
    Name = var.tags["name"]
    owner = var.tags["owner"]
  }
}
#  subnet
resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.cidr[1]

  tags = {
    Name = var.tags["name"]
    owner = var.tags["owner"]
  }
}
# internet gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = var.tags["name"]
    owner = var.tags["owner"]
  }
}
# route table
resource "aws_route_table" "example" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = var.cidr[1]
    gateway_id = aws_internet_gateway.gw.id
  }
  tags = {
    Name = var.tags["name"]
    owner = var.tags["owner"]
  }
}