# route53/main.tf
# Fernando Gutierrez

resource "aws_route53_zone" "ft_route53_zone" {
  name = var.domain_name
  tags = {
    Name = var.domain_name
  }
}

resource "aws_route53_record" "alb_dns" {
  zone_id = aws_route53_zone.ft_route53_zone.zone_id
  name    = "www.${var.domain_name}"
  type    = "A"

  alias {
    name                   = var.alb_dns_name
    zone_id                = var.alb_zone_id
    evaluate_target_health = true
  }
}

resource "aws_acm_certificate" "ssl_certificate" {
  domain_name       = "*.${var.domain_name}"
  validation_method = "DNS"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_route53_record" "ssl_validation" {
  for_each = {
    for dvo in aws_acm_certificate.ssl_certificate.domain_validation_options : dvo.domain_name => {
      name  = dvo.resource_record_name
      type  = dvo.resource_record_type
      value = dvo.resource_record_value
    }
  }

  zone_id = aws_route53_zone.ft_route53_zone.zone_id
  name    = each.value.name
  type    = each.value.type
  records = [each.value.value]
  ttl     = 60
}

