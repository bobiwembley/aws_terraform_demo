resource "aws_security_group" "WebServer" {
  name   = "Ec2-WebServer-Group"
  vpc_id = aws_vpc.WebServerVpc.id
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    description = "authorize 80 on ec2 WebServer"
    from_port   = 80
    protocol    = "tcp"
    self        = false
    to_port     = 80
  }
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    description = "authorize 22 on each server ec2"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"

  }
  egress {
    cidr_blocks      = ["0.0.0.0/0"]
    description      = "outcomming traffic from Ec2"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    ipv6_cidr_blocks = ["::/0"]
  }
  tags = {
    Name = "WebServer_Subnet_allow_all"
  }

}
resource "aws_db_subnet_group" "RDS_Subnet" {
  name       = "rds-subnet-group"
  subnet_ids = ["${aws_subnet.subnet_WebServer_publicA.id}", "${aws_subnet.subnet_WebServer_publicB.id}", "${aws_subnet.subnet_WebServer_publicC.id}", "${aws_subnet.subnet_DataBaseServer.id}"]

  tags = {
    Name = "RDS_Subnet"
  }
}
resource "aws_security_group" "rds_database" {
  name        = "Ec2-RDS-Group"
  vpc_id      = aws_vpc.WebServerVpc.id
  description = "RDS MySQL server"
  ingress {
    cidr_blocks = ["10.10.0.0/16"]
    description = "authorize 3306 on each server ec2"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
  }
  egress {
    protocol    = -1
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}


