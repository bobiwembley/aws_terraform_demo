resource "aws_security_group" "WebServer" {
    name = "Ec2-WebServer-Group"
    vpc_id      = "${aws_vpc.WebServerVpc.id}"
    ingress  {
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
      cidr_blocks = ["0.0.0.0/0" ]
      description = "outcomming traffic from Ec2"
      from_port = 0
      to_port   = 0 
      protocol         = "-1"
      ipv6_cidr_blocks = ["::/0"] 
    }
    tags = {
    Name = "WebServer_Subnet_allow_all"
  }

}
