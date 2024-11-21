# project/main.tf
# Fernando Gutierrez

module "network" {
  source     = "../modules/network"
  aws_region = local.aws_region
}

module "iam" {
  source        = "../modules/iam"
  aws_region    = local.aws_region
  ecs_role_name = local.ecs_role_name
}
module "alb" {
  source            = "../modules/alb"
  aws_region        = local.aws_region
  vpc_id            = module.network.vpc_id
  ft_public_subnets = module.network.public_subnets_id
  ssl_certificate   = module.route53.certificate_arn
}


module "ecs" {
  source                     = "../modules/ecs"
  vpc_id                     = module.network.vpc_id
  private_subnets            = module.network.private_subnets_ecs_id
  ecs_execution_role_arn     = module.iam.ecs_task_execution_role_arn
  target_group_arn           = module.alb.alb_target_group_arn
  cluster_name               = local.ecs_cluster_name
  repo_name                  = local.ecs_repo_name
  service_name               = local.ecs_service_name
  task_family                = local.ecs_task_family
  container_definitions_file = local.ecs_container_definitions
  cpu                        = local.ecs_cpu
  memory                     = local.ecs_memory
  assign_public_ip           = local.ecs_assign_public_ip
  container_name             = local.ecs_container_name
  container_port             = local.ecs_container_port
  desired_task_count         = local.ecs_desired_task_count
}

module "route53" {
  source                 = "../modules/route53"
  alb_dns_name           = module.alb.alb_dns_name
  alb_zone_id            = module.alb.alb_zone_id
  domain_name            = local.route53_domain_name
  subdomain              = local.route53_subdomain
  create_ssl_certificate = local.route53_create_ssl_certificate
}
