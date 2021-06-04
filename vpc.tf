
# VPC
resource "aws_vpc" "terra_vpc" {
  cidr_block       = var.vpc_cidr
  tags = {
    Name = "varVPC"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "terra_igw" {
  vpc_id = aws_vpc.terra_vpc.id
  tags = {
    Name = "var-igw"
  }
}

# Subnets : public
resource "aws_subnet" "public" {
  vpc_id = aws_vpc.terra_vpc.id
  cidr_block = var.subnets_cidr
  availability_zone = var.azs
  map_public_ip_on_launch = true
  tags = {
    Name = "Subnet-var"
  }
}

# Route table: attach Internet Gateway 
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.terra_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.terra_igw.id
  }
  tags = {
    Name = "publicRouteTable"
  }
}

# Route table association with public subnets
resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public_rt.id
}

