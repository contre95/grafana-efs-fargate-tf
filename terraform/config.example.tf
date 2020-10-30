variable "tags" {
  default = {
      "team" : "",
      "project" : "",
      "environment" : "",
      "terraform" : "",
  }
}
variable "ecs-service" {
  default = {
    "task-execution-role" = "arn:aws:iam::1234567890:role/ecsTaskExecutionRole"
    "task-desire-count" = 1
  }
}
variable "networking" {
  default = {
    "subnet_id" = ""
    "subnet_id2" = ""
    "vpc_id" = ""
    "ingress_cidr_blocks" = []
  }
}            
