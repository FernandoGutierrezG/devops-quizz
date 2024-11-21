output "ecs_task_execution_role_arn" {
  value = aws_iam_role.ecs_task_execution_role.arn
}

output "ecs_instance_role_arn" {
  value = aws_iam_role.ecs_instance_role.arn
}

output "rds_role_arn" {
  value = aws_iam_role.ft_rds_role.arn
}
