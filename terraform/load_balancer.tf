resource "aws_lb" "clousec_grafana_app_lb" {
  name               = "clousec-grafana-app-lb"
  internal           = var.networking.load_balancer_internal
  load_balancer_type = "application"
  security_groups    = [aws_security_group.grafana-lb-sg.id]
  subnets            = [var.networking.subnet_id, var.networking.subnet_id2]

  enable_deletion_protection = false

  tags = var.tags
}

resource "aws_lb_target_group" "grafana_target_group" {
  name        = "grafana-target-group"
  port        = 3000
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = var.networking.vpc_id
  
  health_check {
      path = "/login"
  }

    depends_on = [aws_lb.clousec_grafana_app_lb]
}

resource "aws_lb_listener" "grafana_listerner" {
  load_balancer_arn = aws_lb.clousec_grafana_app_lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.grafana_target_group.arn
  }
}
