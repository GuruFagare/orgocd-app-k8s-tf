resource "aws_vpc" "appscrip_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "appscrip-vpc"
  }
}

resource "aws_subnet" "appscrip_public" {
  count                   = length(var.public_subnet_cidrs)
  vpc_id                  = aws_vpc.appscrip_vpc.id
  cidr_block              = var.public_subnet_cidrs[count.index]
  availability_zone       = var.public_subnet_azs[count.index]
  map_public_ip_on_launch = true

  tags = {
    Name                                          = "appscrip-public-${count.index + 1}"
    "kubernetes.io/cluster/${var.cluster_name}"   = "shared"
    "kubernetes.io/role/elb"                      = "1"
  }
}

resource "aws_internet_gateway" "appscrip_igw" {
  vpc_id = aws_vpc.appscrip_vpc.id

  tags = {
    Name = "appscrip-igw"
  }
}

resource "aws_route_table" "appscrip_public_rt" {
  vpc_id = aws_vpc.appscrip_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.appscrip_igw.id
  }

  tags = {
    Name = "appscrip-public-rt"
  }
}

resource "aws_route_table_association" "appscrip_public_assoc" {
  count          = length(aws_subnet.appscrip_public)
  subnet_id      = aws_subnet.appscrip_public[count.index].id
  route_table_id = aws_route_table.appscrip_public_rt.id
}
