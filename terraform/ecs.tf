resource "aws_ecs_cluster" "grafana-cluster" {
  name = "grafana-cluster"
}

resource "aws_ecs_service" "grafana-ecs-service" {
  platform_version = "1.4.0"
  name            = "grafana-ecs-service"
  cluster         = aws_ecs_cluster.grafana-cluster.id
  task_definition = aws_ecs_task_definition.grafana-cloudsec.arn
  desired_count   = var.ecs-service.task-desire-count
  #iam_role        = aws_iam_role.foo.arn
  #depends_on      = [aws_iam_role_policy.foo]
  network_configuration {
    subnets = [var.networking.subnet_id]
    security_groups = [aws_security_group.grafana-sg.id]
    assign_public_ip = true
  }

load_balancer {
    target_group_arn = aws_lb_target_group.grafana_target_group.arn
    container_name   = "grafana"
    container_port   = 3000
  }
  
  launch_type = "FARGATE"

 }
