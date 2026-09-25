output "instance_region1_public_ip" {
  value = aws_instance.ec2_region1.public_ip
}

output "instance_region2_public_ip" {
  value = aws_instance.ec2_region2.public_ip
}