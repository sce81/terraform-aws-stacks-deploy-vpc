identity_token "aws" {
  audience = ["aws.workload.identity"]
}

deployment "development" {
  inputs = {
    regions              = ["eu-west-1"]
    role_arn             = "arn:aws:iam::482485466615:role/tfc-wif-simonelliott"
    identity_token       = identity_token.aws.jwt
    vpc_name             = "development"
    env_name             = "stacks"
    vpc_cidr             = "10.100.0.0/16"
    public_subnet_cidr   = ["10.100.0.0/24", "10.100.1.0/24", "10.100.2.0/24"]
    private_subnet_cidr  = ["10.100.10.0/24", "10.100.11.0/24", "10.100.12.0/24"]
    database_subnet_cidr = ["10.100.20.0/24", "10.100.21.0/24", "10.100.22.0/24"]
  }
}

deployment "staging" {
  inputs = {
    regions              = ["eu-west-1"]
    role_arn             = "arn:aws:iam::482485466615:role/tfc-wif-simonelliott"
    identity_token       = identity_token.aws.jwt
    vpc_name             = "staging"
    env_name             = "stacks"
    vpc_cidr             = "10.200.0.0/16"
    public_subnet_cidr   = ["10.200.0.0/24", "10.200.1.0/24", "10.200.2.0/24"]
    private_subnet_cidr  = ["10.200.10.0/24", "10.200.11.0/24", "10.200.12.0/24"]
    database_subnet_cidr = ["10.200.20.0/24", "10.200.21.0/24", "10.200.22.0/24"]
  }
}
//
//deployment "production" {
//  inputs = {
//    regions              = ["eu-west-1", "us-west-1"]
//    role_arn             = "arn:aws:iam::482485466615:role/tfc-wif-simonelliott"
//    identity_token       = identity_token.aws.jwt
//    vpc_name             = "production"
//    env_name             = "stacks"
//    vpc_cidr             = "10.210.0.0/16"
//    public_subnet_cidr   = ["10.210.0.0/24", "10.210.1.0/24", "10.210.2.0/24"]
//    private_subnet_cidr  = ["10.210.10.0/24", "10.210.11.0/24", "10.210.12.0/24"]
//    database_subnet_cidr = ["10.210.20.0/24", "10.210.21.0/24", "10.210.22.0/24"]
//  }
//}
