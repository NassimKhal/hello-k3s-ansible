# Create security group for your EC2 instance
resource "aws_security_group" "flask_sg" {
  name        = "flask-sg"
  description = "Allow SSH and HTTP inbound traffic"

  ingress {
    description      = "SSH access"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    description      = "HTTP access"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "flask-sg"
  }
}

# EC2 instance creation
resource "aws_instance" "flask_instance" {
  ami                    = "ami-0f9de6e2d2f067fca" # Amazon Ubuntu 22.04 AMI (us-east-1)
  instance_type          = var.instance_type
  vpc_security_group_ids     = [aws_security_group.flask_sg.id]

  tags = {
    Name = "flask-ec2-instance"
  }
}
