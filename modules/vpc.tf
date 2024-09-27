resource "aws_vpc" "this" {
    cidr_block = var.vpc_cidr
    instance_tenancy = var.vpc_instance_tenency

    tags = {
      Name = "${var.batch_code}-${var.batch_mode}-${var.batch_month}-vpc"
      CreatedBy = var.provisioned_by
    }
  
}

resource "aws_subnet" "this-public" {
    cidr_block = var.public_subnet_cidr
    vpc_id = aws_vpc.this.id
    availability_zone = var.public_subnet_az

    tags = {
      Name = "${var.batch_code}-${var.batch_mode}-${var.batch_month}-public-subnet"
      CreatedBy = var.provisioned_by
    }
  
}

resource "aws_subnet" "this-private" {
  count = var.isPrivateSubnetNeeded == true ? 1 : 0

    cidr_block = var.private_subnet_cidr
    vpc_id = aws_vpc.this.id
    availability_zone = var.private_subnet_az
  
  tags = {
      Name = "${var.batch_code}-${var.batch_mode}-${var.batch_month}-private-subnet"
      CreatedBy = var.provisioned_by
    }
}

resource "aws_route_table" "public-RT" {
  vpc_id = aws_vpc.this.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.this.id
  }
  
}

resource "aws_route_table" "private-RT" {
  count = var.isPrivateSubnetNeeded == true ? 1 : 0
  vpc_id = aws_vpc.this.id
  
}

resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id
  
}

resource "aws_route_table_association" "this-public" {
  subnet_id = aws_subnet.this-public.id
  route_table_id = aws_route_table.public-RT.id
  
}

resource "aws_route_table_association" "this-private" {
  count = var.isPrivateSubnetNeeded == true ? 1 : 0

  subnet_id = aws_subnet.this-private[count.index].id
  route_table_id = aws_route_table.private-RT[count.index].id
  
}

resource "aws_flow_log" "this" {
  log_destination = "arn:aws:s3:::tg-devops-9am-weekday-july"
  log_format = "$${interface-id} $${srcaddr} $${dstaddr} $${srcport} $${dstport}"
  vpc_id = aws_vpc.this.id
  log_destination_type = "s3"
  traffic_type = "ALL"
  
}