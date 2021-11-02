
resource "aws_vpc" "WebServerVpc" {
    cidr_block         = "${var.vpc_cidr}"
    enable_dns_support = "true"
    enable_dns_hostnames = "true" #gives you an internal host name
      tags      = {
          Name = "WebServer"        
      }
  }

resource "aws_subnet" "subnet_WebServer_public" {
    vpc_id                  = "${aws_vpc.WebServerVpc.id}"
    cidr_block              = "${var.subnets_cidr[0]}"
    map_public_ip_on_launch = "true" 
    availability_zone       = "${var.region}a"
    tags    =  {
          Name = "SubnetWebServer"
       } 

}


resource "aws_subnet" "subnet_DataBaseServer" {
    vpc_id                  = "${aws_vpc.WebServerVpc.id}"
    cidr_block              = "${var.subnets_cidr[1]}"
    availability_zone       = "${var.region}b"
       tags    =  {
          Name = "SubnetDataBase"
       } 

}

resource "aws_internet_gateway" "gw-WebServer" {
  vpc_id = "${aws_vpc.WebServerVpc.id}"

  tags = {
    Name = "gw-Kouka-demo"
  }

}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.WebServerVpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.gw-WebServer.id}"
  }
  tags = {
    Name = "publicRouteTable"
  }
}

resource "aws_route_table_association" "access_WebServer" {
  subnet_id      = "${aws_subnet.subnet_WebServer_public.id}"
  route_table_id = "${aws_route_table.public_rt.id}"
}
