resource "aws_efs_file_system" "grafana-efs" {
  tags = var.tags
}

resource "aws_efs_mount_target" "grafana-mount" {
  file_system_id = aws_efs_file_system.grafana-efs.id
  subnet_id      = var.networking.subnet_id
  security_groups = [aws_security_group.efs-sg.id]
  #tags = var.tags
}

#resource "aws_efs_file_system_policy" "policy" {
  #file_system_id = aws_efs_file_system.grafana-efs.id

  #policy = <<POLICY
#{
    #"Version": "2012-10-17",
    #"Id": "ExamplePolicy01",
    #"Statement": [
        #{
            #"Sid": "ExampleSatement01",
            #"Effect": "Allow",
            #"Principal": {
                #"AWS": "*"
            #},
            #"Action": [
                #"elasticfilesystem:ClientMount",
                #"elasticfilesystem:ClientRootAccess",
                #"elasticfilesystem:ClientWrite"
            #]
            
        #}
    #]
#}
#POLICY
#}

resource "aws_efs_access_point" "grafana-ap" {
  file_system_id = aws_efs_file_system.grafana-efs.id

  posix_user {
    gid = "472"
    uid = "472"
  }
  root_directory {
    path = "/ecs/grafana"
    creation_info {
      owner_gid = "472"
      owner_uid= "472"
      permissions = "0777"
    }
  }

}
