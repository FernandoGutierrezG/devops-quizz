# ecs/main.tf
# Fernando Gutierrez

resource "aws_security_group" "ecs_sg" {
  name        = "${var.cluster_name}-sg"
  vpc_id      = var.vpc_id
  description = "ECS Security Group"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

    ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

   # just for test
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "python-ecs-sg"
  }  
}

resource "aws_ecr_repository" "ft_ecr" {
  name = var.repo_name
  tags = {
    Name = var.repo_name
  }
}

resource "aws_ecs_cluster" "python_ecs" {
  name = var.cluster_name
  tags = {
    Name = var.cluster_name
  }
}

resource "aws_ecs_task_definition" "python_task" {
  family                   = var.task_family
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = var.cpu
  memory                   = var.memory
  execution_role_arn       = var.ecs_execution_role_arn
  container_definitions    = var.container_definitions_file
}

resource "aws_ecs_service" "python_service" {
  name            = var.service_name
  cluster         = aws_ecs_cluster.python_ecs.id
  task_definition = aws_ecs_task_definition.python_task.arn
  desired_count   = var.desired_task_count
  launch_type     = "FARGATE"

  network_configuration {
    subnets          = var.private_subnets
    security_groups = [aws_security_group.ecs_sg.id]
    assign_public_ip = var.assign_public_ip
  }

  load_balancer {
    target_group_arn = var.target_group_arn
    container_name   = var.container_name
    container_port   = var.container_port
  }
}

