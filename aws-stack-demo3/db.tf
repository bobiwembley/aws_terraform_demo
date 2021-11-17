resource "aws_db_instance" "SqlServer" {
  allocated_storage      = 10
  engine                 = "mysql"
  engine_version         = "5.7"
  instance_class         = "db.t3.micro"
  name                   = "koukaDb"
  username               = "kouka"
  password               = "koukaPwd"
  parameter_group_name   = "default.mysql5.7"
  skip_final_snapshot    = true
  db_subnet_group_name   = aws_db_subnet_group.RDS_Subnet.id
  vpc_security_group_ids = ["${aws_security_group.rds_database.id}"]
}
