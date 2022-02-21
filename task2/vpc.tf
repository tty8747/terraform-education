resource "aws_vpc" "nginx" {
  cidr_block = var.cidr_block
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "nginx"
  }
}

resource "aws_subnet" "nginx" {
  vpc_id                  = aws_vpc.nginx.id
  cidr_block              = var.subnet
  map_public_ip_on_launch = "true"
  availability_zone       = "eu-central-1a"

  tags = {
    Name = "nginx"
  }
}

resource "aws_internet_gateway" "nginx" {
  vpc_id = aws_vpc.nginx.id

  tags = {
    Name = "nginx"
  }
}

resource "aws_default_route_table" "public" {
  default_route_table_id = aws_vpc.nginx.default_route_table_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.nginx.id
  }

  tags = {
    Name = "nginx"
  }
}
