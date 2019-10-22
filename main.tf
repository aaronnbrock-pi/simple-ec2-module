resource "aws_instance" "simple" {
  ami           = "ami-04b9e92b5572fa0d1"
  instance_type = "t2.micro"
  tags = {
      Name = "${var.ec2_name}"
  }
}
