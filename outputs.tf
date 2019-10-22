output "ec2_ip" {
  value = aws_instance.simple.public_ip
  description = "The public ip of the created ec2 instance."
}