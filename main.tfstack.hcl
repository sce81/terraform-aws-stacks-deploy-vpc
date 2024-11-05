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
    aws    = provider.aws.configurations[each.value]

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
}

component "igw" {
  for_each = var.regions

  source = "github.com/sce81/terraform-aws-internet-gateway"
  inputs = {
      vpc_id   = component.vpc[each.value].vpc_id
      name     = var.vpc_name
      env_name = var.env_name
  }
}
