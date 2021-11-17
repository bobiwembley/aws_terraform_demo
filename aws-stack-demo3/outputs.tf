output "elb_id" {
  description = "The name of the ELB"
  value       = concat(aws_elb.autoscalling_group_elb_Web.*.id, [""])[0]
}

output "elb_name" {
  description = "The name of the ELB"
  value       = concat(aws_elb.autoscalling_group_elb_Web.*.name, [""])[0]
}

output "elb_dns_name" {
  description = "The DNS name of the ELB"
  value       = concat(aws_elb.autoscalling_group_elb_Web.*.dns_name, [""])[0]
}

output "elb_instances" {
  description = "The list of instances in the ELB"
  value       = flatten(aws_elb.autoscalling_group_elb_Web.*.instances)
}

output "db_password" {
  description = "The DB password to to the RDS database"
  value       = random_password.password.result
  sensitive   = true
}

#Output the address (aka hostname) of the RDS instance
output "rds_instance_address" {
  value = "${aws_db_instance.SqlServer.address}"
}

# Output endpoint (hostname:port) of the RDS instance
output "rds_instance_endpoint" {
  value = "${aws_db_instance.SqlServer.endpoint}"
}