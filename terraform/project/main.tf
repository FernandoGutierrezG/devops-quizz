# project/main.tf
# Fernando Gutierrez

module "network" {
  source     = "../modules/network"
  aws_region = local.aws_region
}

# module "alb" {
#   source     = "../modules/alb"
#   aws_region = local.aws_region
# }

# module "iam" {
#   source     = "../modules/iam"
#   aws_region = local.aws_region
#   ecs_role_name = local.ecs_role_name
# }

# module "container" {
#   source            = "../modules/container"
#   vpc_id            = module.network.vpc_id
#   aws_region        = local.aws_region
#   ft_public_subnets  = [ module.network.public_subnet1, module.network.public_subnet2 ]
#   ft_security_group = module.network.security_group
#   ecs_execution_role_arn = module.iam.ecs_task_execution_role_arn
# }
