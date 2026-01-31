resource "aws_security_group" "app_sg" {
  name_prefix = "app-sg-"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Permite HTTP de qualquer lugar
  }

  # ingress {
  #   from_port   = 2424
  #   to_port     = 2424
  #   protocol    = "tcp"
  #   cidr_blocks = ["0.0.0.0/0"]
  # }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["200.17.34.9/32"] # Permite SSH apenas do meu IP público
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"] # Permite todo e qualquer o tráfego de saída
  }

  tags = {
    Name = "SG EC2 DevOps Pos Graduacao"
  }
}

resource "aws_instance" "app" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.app_sg.id] # Associa o SG

  associate_public_ip_address = true

  root_block_device {
    volume_size = 10
    volume_type = "gp2"
  }

  tags = {
    Name = "EC2 DevOps Pos Graduacao"
    Team = "IaC Class"
  }
}

output "ec2_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.app.public_ip
}

output "ec2_public_dns" {
  description = "Public DNS name of the EC2 instance"
  value       = aws_instance.app.public_dns
}
