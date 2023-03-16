resource "aws_vpc" "main" {
  cidr_block = var.cidr_block
}

resource "aws_subnet" "public-subnet1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.0.0/24"
  }

resource "aws_subnet" "public-subnet2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"
  }

 resource "aws_subnet" "private-instance1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.15.0/24"
  }
   
  resource "aws_subnet" "private-instance2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.16.0/24"
  }

  resource "aws_subnet" "private-instance3" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.2.0/24"
  }

  resource "aws_subnet" "private-instance4" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.3.0/24"
  }

resource "aws_nat_gateway" "main" {
  subnet_id = aws_vpc.main.id
}

resource "aws_eip" "nat1" {
  vpc      = true
}

resource "aws_eip" "nat2" {
  vpc      = true
}

  
  resource "aws_nat_gateway" "main1" {
  allocation_id = aws_eip.nat1.id
  subnet_id     = aws_subnet.public-subnet1.id
}

   resource "aws_nat_gateway" "main2" {
  allocation_id = aws_eip.nat2.id
  subnet_id     = aws_subnet.public-subnet2.id
}

resource "aws_route_table" "public-subnet" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.main.id
  }
}

resource "aws_route_table" "private-instance" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.main.id
  }
}

resource "aws_route_table_association" "public-subnet1" {
  subnet_id      = aws_subnet.public-subnet1.id
  route_table_id = aws_route_table.public-subnet.id
}

resource "aws_route_table_association" "public-subnet2" {
  subnet_id      = aws_subnet.public-subnet2.id
  route_table_id = aws_route_table.public-subnet.id
}

resource "aws_route_table_association" "private-instance1" {
  subnet_id      = aws_subnet.private-instance1.id
  route_table_id = aws_route_table.private-instance.id
}

resource "aws_route_table_association" "private-instance2" {
  subnet_id      = aws_subnet.private-instance2.id
  route_table_id = aws_route_table.private-instance.id
}

resource "aws_route_table_association" "private-instance3" {
  subnet_id      = aws_subnet.private-instance3.id
  route_table_id = aws_route_table.private-instance.id
}

resource "aws_route_table_association" "private-instance4" {
  subnet_id      = aws_subnet.private-instance4.id
  route_table_id = aws_route_table.private-instance.id
}