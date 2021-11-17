
resource "aws_vpc" "WebServerVpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = "true"
  enable_dns_hostnames = "true" #gives you an internal host name
  tags = {
    Name = "WebServer"
  }
}

resource "aws_subnet" "subnet_WebServer_publicA" {
  vpc_id                  = aws_vpc.WebServerVpc.id
  cidr_block              = var.subnets_cidr[1]
  map_public_ip_on_launch = "true"
  availability_zone       = data.aws_availability_zones.available.names[1]
  tags = {
    Name = "SubnetPublicA"
  }

}

resource "aws_subnet" "subnet_WebServer_publicB" {
  vpc_id                  = aws_vpc.WebServerVpc.id
  cidr_block              = var.subnets_cidr[2]
  map_public_ip_on_launch = "true"
  availability_zone       = data.aws_availability_zones.available.names[2]
  tags = {
    Name = "SubnetPublicB"
  }

}

resource "aws_subnet" "subnet_WebServer_publicC" {
  vpc_id                  = aws_vpc.WebServerVpc.id
  cidr_block              = var.subnets_cidr[3]
  map_public_ip_on_launch = "true"
  availability_zone       = data.aws_availability_zones.available.names[3]
  tags = {
    Name = "SubnetPublicC"
  }

}


resource "aws_subnet" "subnet_DataBaseServer" {
  vpc_id            = aws_vpc.WebServerVpc.id
  cidr_block        = var.subnets_cidr[0]
  availability_zone = data.aws_availability_zones.available.names[0]
  tags = {
    Name = "SubnetDataBase"
  }

}

resource "aws_internet_gateway" "gw-WebServer" {
  vpc_id = aws_vpc.WebServerVpc.id

  tags = {
    Name = "gw-Kouka-demo"
  }

}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.WebServerVpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw-WebServer.id
  }
  tags = {
    Name = "publicRouteTable"
  }
}

resource "aws_route_table_association" "public-subnetA" {
  subnet_id      = aws_subnet.subnet_WebServer_publicA.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "public-subnetB" {
  subnet_id      = aws_subnet.subnet_WebServer_publicB.id
  route_table_id = aws_route_table.public_rt.id
}


resource "aws_route_table_association" "public-subnetC" {
  subnet_id      = aws_subnet.subnet_WebServer_publicC.id
  route_table_id = aws_route_table.public_rt.id
}
