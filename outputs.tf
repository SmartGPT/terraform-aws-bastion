output "bastion_auto_scaling_group_name" {
  description = "The name of the Auto Scaling Group for bastion hosts"
  value       = aws_autoscaling_group.bastion_auto_scaling_group.name
}

output "bastion_elb_id" {
  description = "The ID of the ELB for bastion hosts"
  value       = var.create_elb ? try(aws_lb.bastion_lb[0].id, null) : null
}

output "bastion_host_security_group" {
  description = "The ID of the bastion host security group"
  value       = aws_security_group.bastion_host_security_group[*].id
}

output "bucket_arn" {
  description = "The ARN of the S3 bucket"
  value       = aws_s3_bucket.bucket.arn
}

output "bucket_kms_key_alias" {
  description = "The name of the KMS key alias for the bucket"
  value       = aws_kms_alias.alias.name
}

output "bucket_kms_key_arn" {
  description = "The ARN of the KMS key for the bucket"
  value       = aws_kms_key.key.arn
}

output "bucket_name" {
  description = "The ID of the S3 bucket"
  value       = aws_s3_bucket.bucket.id
}

output "elb_arn" {
  description = "The ARN of the ELB for bastion hosts"
  value       = var.create_elb ? try(aws_lb.bastion_lb[0].arn, null) : null
}

output "elb_ip" {
  description = "The DNS name of the ELB for bastion hosts"
  value       = var.create_elb ? try(aws_lb.bastion_lb[0].dns_name, null) : null
}

output "private_instances_security_group" {
  description = "The ID of the security group for private instances"
  value       = aws_security_group.private_instances_security_group.id
}

output "target_group_arn" {
  description = "The ARN of the target group for the ELB"
  value       = var.create_elb ? try(aws_lb_target_group.bastion_lb_target_group[0].arn, null) : null
}
output "private_ip" {
  description = "The private ip of bastion host when no elb enabled"
  #value       = var.create_elb ? null: try(data.aws_instances.bastion.private_ips[0], null)
  #value       = try(data.aws_instances.bastion[0].private_ips[0], null)  
  value       = try(data.aws_instances.bastion.private_ips[0], null)  
}
output "public_ip" {
  description = "The public ip of bastion host when no elb enabled"
  #value       = var.create_elb ? null: try(data.aws_instances.bastion.public_ips[0], null)
  #value       = try(data.aws_instances.bastion[0].public_ips[0], null)
  value       = try(data.aws_instances.bastion.public_ips[0], null)
}
