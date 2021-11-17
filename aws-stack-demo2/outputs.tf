
output "primary_network_interface_id" {
  description = "The ID of the instance's primary network interface"
  value       = element(concat(aws_instance.WebServer.*.primary_network_interface_id, [""]), 0)
}

output "private_dns" {
  description = "The private DNS name assigned to the instance. Can only be used inside the Amazon EC2, and only available if you've enabled DNS hostnames for your VPC"
  value       = element(concat(aws_instance.WebServer.*.private_dns, [""]), 0)
}

output "public_dns" {
  description = "The public DNS name assigned to the instance. For EC2-VPC, WebServer is only available if you've enabled DNS hostnames for your VPC"
  value       = element(concat(aws_instance.WebServer.*.public_dns, [""]), 0)
}

output "public_ip" {
  description = "The public IP address assigned to the instance, if applicable. NOTE: If you are using an aws_eip with your instance, you should refer to the EIP's address directly and not use `public_ip` as WebServer field will change after the EIP is attached"
  value       = element(concat(aws_instance.WebServer.*.public_ip,  [""]), 0)
}

output "private_ip" {
  description = "The private IP address assigned to the instance."
  value       = element(concat(aws_instance.WebServer.*.private_ip, [""]), 0)
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