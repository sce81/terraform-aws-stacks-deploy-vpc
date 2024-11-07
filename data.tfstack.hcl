locals {


  // public_route_info  = var.enable_igw == false ? tolist(var.public_route_info) : concat(local.public_route_igw, local.ingress_route_info)

  public_route_info  = { for region in var.regions : region => var.enable_igw == false ? tolist(var.public_route_info) : concat(local.public_route_igw[region], local.ingress_route_info) } //local.private_route_natgw[region]}
  private_route_info = { for region in var.regions : region => var.enable_natgw == false ? var.private_route_info : local.private_route_natgw[region] }
  ingress_route_info = { for region in var.regions : region => var.tgw_id == null ? [] : local.ingress_route_tgw }

  public_route_igw = var.enable_igw == false ? null : {
    for region in var.regions : region => [
      {
        route_cidr     = "0.0.0.0/0"
        nat_gateway_id = element(component.internet-gateway[region].id, 0)
      }
    ]
  }
  private_route_natgw = var.enable_natgw == false ? null : {
    for region in var.regions : region => [
      {
        route_cidr     = "0.0.0.0/0"
        nat_gateway_id = element(component.nat_gateway[region].id, 0)
      }
    ]
  }
  ingress_route_tgw = var.tgw_id == null ? null : {
    for region in var.regions : region => [
      {
        route_cidr         = "0.0.0.0/0"
        transit_gateway_id = var.tgw_id
      }
    ]
  }
}

