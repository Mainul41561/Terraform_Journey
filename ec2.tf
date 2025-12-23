# aws key pair
resource "aws_key_pair" "terra_key" {
  key_name   = "deployer_key"
  public_key = file("terr-key.pub")
}

# aws default vpc
resource "aws_default_vpc" "default_vpc" {

}

# aws security group
resource "aws_security_group" "terra_sg" {
  name        = "terra_sg"
  description = "Allow user to connect"
  vpc_id      = aws_default_vpc.default_vpc.id

  # inbound rule
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 8000
    to_port     = 8000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  # outbound rule
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


# ec2 instance
resource "aws_instance" "terra_instance" {
  ami                         = "ami-0f5fcdfbd140e4ab7" # ubuntu AMI
  instance_type               = "t2.micro"
  key_name                    = aws_key_pair.terra_key.key_name
  vpc_security_group_ids      = [aws_security_group.terra_sg.name]
  associate_public_ip_address = true

  tags = {
    Name = "terra_instance"
  }

}