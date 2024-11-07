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

variable "enable_igw" {
  type        = bool
  description = "Boolean: Deploy Internet GW to this VPC"
  default     = false
}
variable "enable_natgw" {
  type        = bool
  description = "Boolean: Deploy NAT GW to this VPC"
  default     = false
}
variable "tgw_id" {
  type        = string
  description = "ID of Transit gateway (if one exists) to route traffic back to"
  default     = null
}
variable "network_cidr" {
  type        = string
  description = "Complete CIDR of internal network"
  default     = "10.0.0.0/8"
}

variable "public_route_info" {
  description = "Route Info for public route table"
  type = list(object({
    route_cidr     = optional(string)
    gateway_id     = optional(string)
    nat_gateway_id = optional(string)
  }))
  default = []
}

variable "private_route_info" {
  description = "Route Info for private route table"
  type = list(object({
    route_cidr     = optional(string)
    gateway_id     = optional(string)
    nat_gateway_id = optional(string)
  }))
  default = []
}