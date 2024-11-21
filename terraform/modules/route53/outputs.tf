# route53/outputs.tf
# Fernando Gutierrez
output "hosted_zone_id" {
  description = "The ID of the hosted zone"
  value       = aws_route53_zone.ft_route53_zone.zone_id
}

output "domain_name" {
  description = "The fully qualified domain name"
  value       = aws_route53_record.alb_dns.name
}

output "certificate_arn" {
  description = "The ARN of the SSL certificate (if created)"
  value       = aws_acm_certificate.ssl_certificate.arn
}

output "route53_ns" {
  value = aws_route53_zone.ft_route53_zone.name_servers
}


