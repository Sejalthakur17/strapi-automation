# -----------------------------------
# Fetch Latest Ubuntu 22.04 AMI
# -----------------------------------
data "aws_ami" "ubuntu" {
  most_recent = true

  owners = ["099720109477"] # Canonical (Ubuntu)

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

# -----------------------------------
# Security Group
# -----------------------------------
resource "aws_security_group" "strapi_sg7" {
  name        = "task6-strapi-sg7"
  description = "Allow SSH and Strapi access"

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Strapi"
    from_port   = 1337
    to_port     = 1337
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "task6-strapi-sg7"
  }
}

# -----------------------------------
# EC2 Instance
# -----------------------------------
resource "aws_instance" "strapi" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.strapi_sg7.id]

  tags = {
    Name = "strapi-automation"
  }
}

# -----------------------------------
# Output Public IP
# -----------------------------------
output "public_ip" {
  value = aws_instance.strapi.public_ip
}
