variable "regions" {
    type = list(string)
}
variable "env" {
    type = string
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
    type = string
}
variable "private_subnet_cidr" {
    type = string
}
variable "database_subnet_cidr" {
    type = string
}