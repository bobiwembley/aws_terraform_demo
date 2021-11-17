resource "aws_launch_configuration" "launch-configuration_WebServer" {
  image_id        = lookup(var.amis, var.region)
  instance_type   = var.instance_type
  security_groups = ["${aws_security_group.WebServer.id}"]
  key_name        = var.key_name
  user_data       = <<-EOF
                  #!/bin/bash
                  sudo apt-get update
                  sudo apt-get  -y  --force-yes install nginx
                  sudo echo "<p> hello World! powered by kouka Consulting thanks ayyoub </p>" > /usr/share/nginx/html/index.html
                  EOF


}

resource "aws_autoscaling_group" "autoscalling_group_config_EC2WebServer" {
  max_size                  = 3
  min_size                  = 2
  health_check_grace_period = 300
  health_check_type         = "EC2"
  desired_capacity          = 3
  force_delete              = true
  vpc_zone_identifier       = [aws_subnet.subnet_WebServer_publicA.id, aws_subnet.subnet_WebServer_publicB.id, aws_subnet.subnet_WebServer_publicC.id]
  load_balancers            = ["${aws_elb.autoscalling_group_elb_Web.name}"]
  launch_configuration      = aws_launch_configuration.launch-configuration_WebServer.name

  lifecycle {
    create_before_destroy = true
  }

}

