# AWS EC2 Security group for MasterTV
resource "aws_security_group" "grafana-sg" {
  name = "grafana_cloudsec_sg"
  description = "Allow Grafana ports"
  vpc_id = var.networking.vpc_id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 3000
    to_port = 3000
    protocol = "tcp"
    security_groups = [aws_security_group.grafana-lb-sg.id]
  }

  tags = var.tags
}

resource "aws_security_group" "grafana-lb-sg" {
  name = "grafana-lb-sg"
  description = "Allow Grafana ports"
  vpc_id = var.networking.vpc_id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = var.networking.ingress_cidr_blocks
  }

  tags = var.tags
}

resource "aws_security_group" "efs-sg" {
  vpc_id = var.networking.vpc_id
  name = "efs-sg"
  description = "Allow Grafana ports"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  ingress {
    from_port = 2049
    to_port = 2049
    protocol = "tcp"
    security_groups = [aws_security_group.grafana-sg.id]
  }
  
  tags = var.tags
}

