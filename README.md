# Grafana + EFS + Fargate

## Configurations
```shell
cd terraform
mv config.example.tf config.tf
```
All configurations can now be setup from the `config.tf` file
```shell
terraform init
terarform apply

```
All configurations can be setup from the `config.tf` file

```terraform
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
```
