# Triggering plan
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

  ingress {
    description      = "Kubernetes NodePort"
    from_port        = 30001
    to_port          = 30001
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

# Import SSH public key into AWS
resource "aws_key_pair" "hello_k3s_ansible_key" {
  key_name   = "hello-k3s-ansible-key"
  public_key = var.ssh_public_key
}


# EC2 instance creation
resource "aws_instance" "flask_instance" {
  ami                    = "ami-0f9de6e2d2f067fca" # Amazon Ubuntu 22.04 AMI (us-east-1)
  instance_type          = var.instance_type
  vpc_security_group_ids     = [aws_security_group.flask_sg.id]
  key_name               = aws_key_pair.hello_k3s_ansible_key.key_name  


  tags = {
    Name = "flask-ec2-instance"
  }
}

# Automated inventory.ini generation
resource "local_file" "ansible_inventory" {
  filename = "../ansible/inventory.ini"
  content  = <<-EOF
  [flask_server]
  ${aws_instance.flask_instance.public_ip} ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/hello-k3s-ansible-key
  EOF
}
