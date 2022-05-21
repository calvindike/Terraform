resource "aws_vpc" "vpc" {
  cidr_block           = var.cidr_block_range
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Environment = var.environment_tag
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Environment = var.environment_tag
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.subnet1_cidr_block_range
  map_public_ip_on_launch = "true"
  availability_zone       = "us-east-1a"
  tags = {
    Environment = var.environment_tag
    Type        = "Public"
    Name        = "public_subnet"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Environment = var.environment_tag
  }
}

resource "aws_route_table_association" "default" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public.id
}
