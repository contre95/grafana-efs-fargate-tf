resource "aws_ecs_task_definition" "grafana-cloudsec" {
  family                = "grafana-task"
  container_definitions = file("container-definitions/grafana.json")
  network_mode = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  memory = "512"
  cpu = "256"
  execution_role_arn = var.ecs-service.task-execution-role

  tags = var.tags
  	volume {                                                   
   name      = "grafana-efs"                                 
   efs_volume_configuration {                                
       file_system_id = aws_efs_file_system.grafana-efs.id   
       root_directory = "/ecs/grafana"                       
       transit_encryption = "ENABLED"                        
  			authorization_config {                               
        access_point_id = aws_efs_access_point.grafana-ap.id 
      }                                                      
   	}                                                        
   }                                                         
}
