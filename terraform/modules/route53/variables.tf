# route53/variables.tf
# Fernando Gutierrez

variable "domain_name" {
  description = "The root domain name (e.g., example.com)"
  type        = string
}

variable "subdomain" {
  description = "The subdomain name (e.g., www or empty for root)"
  type        = string
  default     = ""
}

variable "alb_dns_name" {
  description = "The DNS name of the Application Load Balancer"
  type        = string
}

variable "alb_zone_id" {
  description = "The hosted zone ID of the ALB"
  type        = string
}

variable "create_ssl_certificate" {
  description = "Whether to create an SSL certificate"
  type        = bool
  default     = false
}
