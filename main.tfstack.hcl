component "vpc" {
  for_each = var.regions

  source = "github.com/sce81/terraform-aws-vpc-network"

  inputs = {
    region               = each.value
    name                 = var.vpc_name
    env                  = var.env_name
    vpc_cidr             = var.vpc_cidr
    public_subnet_cidr   = var.public_subnet_cidr
    private_subnet_cidr  = var.private_subnet_cidr
    database_subnet_cidr = var.database_subnet_cidr
  }

  providers = {
    aws = provider.aws.configurations[each.value]

  }
}

component "natgw" {
  for_each = var.regions

  source = "github.com/sce81/terraform-aws-module-nat-gateway"

  inputs = {
    vpc_id   = component.vpc[each.value].vpc_id
    name     = var.vpc_name
    env_name = var.env_name
  }
  providers = {
    aws = provider.aws.configurations[each.value]

  }
}

component "igw" {
  for_each = var.regions

  source = "github.com/sce81/terraform-aws-internet-gateway"
  inputs = {
    vpc_id   = component.vpc[each.value].vpc_id
    name     = var.vpc_name
    env_name = var.env_name
  }
  providers = {
    aws = provider.aws.configurations[each.value]

  }
}

component "pubic-route" {
  for_each = var.regions

  source = "github.com/sce81/terraform-aws-module-vpc-route-table"
  inputs = {
    name     = var.vpc_name
    env_name = var.env_name
    route_name = ["public-route-table"]
    vpc_id     = component.vpc[each.value].vpc_id
    subnet_ids = component.vpc[each.value].public_subnet_ids
  }
  providers = {
    aws = provider.aws.configurations[each.value]

  }
}

component "private-route" {
  for_each = var.regions

  source = "github.com/sce81/terraform-aws-module-vpc-route-table"
  inputs = {
    name     = var.vpc_name
    env_name = var.env_name
    route_name = ["private-route-table"]
    vpc_id     = component.vpc[each.value].vpc_id
    subnet_ids = component.vpc[each.value].private_subnet_ids
  }
  providers = {
    aws = provider.aws.configurations[each.value]

  }
}
