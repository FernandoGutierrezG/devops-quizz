# network/main.tf
# Fernando Gutierrez

resource "aws_vpc" "finch_vpc_dev" {
  cidr_block = var.vpc_cidr_block
  tags = {
    Name = "Finch-VPC"
  }
}

############################ Subnets #######################################
resource "aws_subnet" "finch_public" {
  count                   = 2
  vpc_id                  = aws_vpc.finch_vpc_dev.id
  cidr_block              = element(var.public_subnets, count.index)
  availability_zone       = element(var.availability_zones, count.index)
  map_public_ip_on_launch = true
  tags = {
    Name = "finch_public_subnet_${count.index + 1}"
  }
}

resource "aws_subnet" "finch_private_ecs" {
  count             = 2
  vpc_id            = aws_vpc.finch_vpc_dev.id
  cidr_block        = element(var.private_subnets, count.index)
  availability_zone = element(var.availability_zones, count.index)

  tags = {
    Name = "finch_private_subnet_ecs_${count.index + 1}"
  }
}

resource "aws_subnet" "finch_private_rds" {
  count             = 2
  vpc_id            = aws_vpc.finch_vpc_dev.id
  cidr_block        = element(var.db_subnets, count.index)
  availability_zone = element(var.availability_zones, count.index)
  tags = {
    Name = "finch_private_subnet_rds_${count.index + 1}"
  }
}

############################ IGW and NAT_GW #######################################
resource "aws_internet_gateway" "finch_igw" {
  vpc_id = aws_vpc.finch_vpc_dev.id
  tags = {
    Name = "Finch-IGW"
  }
}

resource "aws_eip" "eip_az" {
  count  = 2
  domain = "vpc"
  tags = {
    Name = "Finch-EIP-${count.index + 1}"
  }
}

resource "aws_nat_gateway" "finch_nat_gw" {
  count         = 2
  allocation_id = aws_eip.eip_az[count.index].id
  subnet_id     = aws_subnet.finch_public[count.index].id

  tags = {
    Name = "finch-NAT-Gateway-${count.index + 1}"
  }
}

########################## Public Route Tables ###################################
resource "aws_route_table" "finch_public_rt" {
  vpc_id = aws_vpc.finch_vpc_dev.id
  tags = {
    Name = "finch-public-rt"
  }
}

resource "aws_route" "finch_public_route" {
  route_table_id         = aws_route_table.finch_public_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.finch_igw.id
}


resource "aws_route_table_association" "finch_public_rt_assoc" {
  count          = 2
  subnet_id      = aws_subnet.finch_public[count.index].id
  route_table_id = aws_route_table.finch_public_rt.id
}

########################## Private Route Tables for ECS ###################################
resource "aws_route_table" "finch_private_rt_ecs" {
  vpc_id = aws_vpc.finch_vpc_dev.id
  tags = {
    Name = "finch-private-rt-ecs"
  }
}

resource "aws_route" "finch_private_route_ecs_nat" {
  route_table_id         = aws_route_table.finch_private_rt_ecs.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.finch_nat_gw[0].id
}

########################## Private Route Tables for RDS ###################################
resource "aws_route_table" "finch_private_rt_rds" {
  vpc_id = aws_vpc.finch_vpc_dev.id
  tags = {
    Name = "finch-private-rt-rds"
  }
}

resource "aws_route" "finch_private_route_rds_nat" {
  route_table_id         = aws_route_table.finch_private_rt_rds.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.finch_nat_gw[1].id
}



resource "aws_route_table_association" "finch_private_ecs_nat_assoc_az1" {
  subnet_id      = aws_subnet.finch_private_ecs[0].id
  route_table_id = aws_route_table.finch_private_rt_ecs.id
}

resource "aws_route_table_association" "finch_private_rds_nat_assoc_az1" {
  subnet_id      = aws_subnet.finch_private_rds[0].id
  route_table_id = aws_route_table.finch_private_rt_ecs.id
}

resource "aws_route_table_association" "finch_private_ecs_nat_assoc_az2" {
  subnet_id      = aws_subnet.finch_private_ecs[1].id
  route_table_id = aws_route_table.finch_private_rt_rds.id
}

resource "aws_route_table_association" "finch_private_rds_nat_assoc_az2" {
  subnet_id      = aws_subnet.finch_private_rds[1].id
  route_table_id = aws_route_table.finch_private_rt_rds.id
}