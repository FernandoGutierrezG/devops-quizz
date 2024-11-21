# alb/outputs.tf
# Fernando Gutierrez
output "alb_arn" {
  description = "The ARN of the ALB"
  value       = aws_lb.alb.arn
}

output "alb_target_group_arn" {
  description = "The ARN of the ALB target group"
  value       = aws_lb_target_group.ecs_tg.arn
}

output "alb_dns_name" {
  description = "The DNS name of the ALB"
  value       = aws_lb.alb.dns_name
}

output "alb_zone_id" {
  description = "The hosted zone ID of the ALB"
  value       = aws_lb.alb.zone_id
}

