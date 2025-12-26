#output for count-based resource
# output "ec2_public_ip" {
#   description = "Public IP of the EC2 instance"
#   value       = aws_instance.terra_instance[*].public_ip
# }

# output "ec2_public_dns" {
#   description = "Public DNS of the EC2 instance"
#   value       = aws_instance.terra_instance[*].public_dns
# }

# output "ec2_private_ip" {
#   description = "Private IP of the EC2 instance"
#   value       = aws_instance.terra_instance[*].private_ip
# }

# output for for_each-based resource
output "ec2_instances_info" {
  description = "Information about the EC2 instances"
  value = {
    for name, instance in aws_instance.terra_instance :
    name => {
      public_ip  = instance.public_ip
      public_dns = instance.public_dns
      private_ip = instance.private_ip
    }
  }
}