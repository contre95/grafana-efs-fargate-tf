# Grafana + EFS + Fargate

## Configurations
```shell
cd terraform
mv config.tf.example config.tf
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
    "task-execution-role" = "arn:aws:iam::123456789:role/ecsTaskExecutionRole"
    "task-desire-count" = 1
  }
}

variable "efs" {
  default = {
    "subnet-id" = ""
    "subnet-id2" = ""
  }
}                           

variable "sg" {
  default = {
    "vpc-id" = ""
  }
}                           
```
