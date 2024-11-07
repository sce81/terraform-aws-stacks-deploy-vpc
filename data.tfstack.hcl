locals {


  public_route_info  = var.enable_igw == false ? tolist(var.public_route_info) : concat(local.public_route_igw, local.ingress_route_info)
  private_route_info = var.enable_natgw == false ? var.private_route_info : local.private_route_natgw
  ingress_route_info = var.tgw_id == null ? [] : local.ingress_route_tgw

  public_route_igw = [
    {
      route_cidr = "0.0.0.0/0"
      gateway_id = var.enable_igw == false ? null : component.internet-gateway[each.value].igw
    }
  ]
  private_route_natgw = [
    {
      route_cidr     = "0.0.0.0/0"
      nat_gateway_id = var.enable_natgw == false ? null : element(component.nat_gateway[each.value].id, 0)
    }
  ]
  ingress_route_tgw = [
    {
      route_cidr         = var.network_cidr
      transit_gateway_id = var.tgw_id == null ? null : var.tgw_id
    }
  ]
}