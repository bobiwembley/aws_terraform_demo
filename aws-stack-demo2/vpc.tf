
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

resource "aws_internet_gateway" "gw-WebServer" {
  vpc_id = "${aws_vpc.WebServerVpc.id}"

  tags = {
    Name = "main"
  }

}
resource "aws_subnet" "subnet_DataBaseServer" {
    vpc_id                  = "${aws_vpc.WebServerVpc.id}"
    cidr_block              = "${var.subnets_cidr[1]}"
    map_public_ip_on_launch = "true" 
    availability_zone       = "${var.region}b"
       tags    =  {
          Name = "SubnetDataBase"
       } 

}
