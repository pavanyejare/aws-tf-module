resource "aws_ecs_cluster" "cluster" {
  name = var.cluster_name
  tags = var.tag

  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}


resource "aws_iam_role" "ExecutionRole" {
  name = "${var.cluster_name}ExecutionRole"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ecs-tasks.amazonaws.com"
        }
      },
    ]
  })

  tags = var.tag
}

resource "aws_iam_role_policy_attachment" "ExecutionRole_to_ecsTaskExecutionRole" {
  role       = aws_iam_role.ExecutionRole.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}


resource "aws_ecs_task_definition" "definition" {
  family = var.family
  # task_role_arn            = var.task_arn
  execution_role_arn       = aws_iam_role.ExecutionRole.arn
  network_mode             = var.network_mode
  cpu                      = var.cpu
  memory                   = var.memory
  requires_compatibilities = ["FARGATE"]
  tags                     = var.tag
  container_definitions    = jsonencode(var.c_def)
  #volume {
  #  name = aws_efs_file_system.efs.creation_token
  #  efs_volume_configuration {
  #    file_system_id = aws_efs_file_system.efs.id
  #    root_directory = "/mnt/efs"
  #  }

  #}
}

resource "aws_ecs_service" "service" {
  name            = var.cluster_name
  cluster         = aws_ecs_cluster.cluster.id
  task_definition = aws_ecs_task_definition.definition.arn
  launch_type     = "FARGATE"
  network_configuration {
    subnets          = var.subnet
    assign_public_ip = true
    security_groups  = var.service_security_group
  }
  load_balancer {
    target_group_arn = var.target_group_arn
    container_name   = var.container_name
    container_port   = var.container_port
  }
  desired_count = var.desired_count
  tags          = var.tag
}


