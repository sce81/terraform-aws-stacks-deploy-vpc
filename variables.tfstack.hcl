variable "regions" {
    type = set(string)
}
variable "vpc_name" {
    type = string
}
variable "env_name" {
    type = string
}
variable "vpc_cidr" {
    type = string
}
variable "public_subnet_cidr" {
    type = list(string)
}
variable "private_subnet_cidr" {
    type = list(string)
}
variable "database_subnet_cidr" {
    type = list(string)
}
variable "identity_token" {
  type      = string
  ephemeral = true
}

variable "role_arn" {
  type = string
}