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