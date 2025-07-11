module "vnet" {
  source  = "Azure/vnet/azurerm"
  version = "5.0.1"
  resource_group_name = "terraformstate"
  vnet_location = "EAST US"
}

output "vnet_id" {
  value = module.vnet.vnet_id
}
