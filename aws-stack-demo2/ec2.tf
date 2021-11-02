resource "aws_instance" "WebServer" {
  ami                    = "${lookup(var.amis,var.region)}"
  key_name               = "${var.key_name}"
  source_dest_check      = false
  instance_type          = "t2.micro"
  subnet_id = "${aws_subnet.subnet_WebServer_public.id}"
  vpc_security_group_ids = ["${aws_security_group.WebServer.id}"]

}

