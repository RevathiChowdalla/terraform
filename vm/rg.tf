resource "azurerm_resource_group" "training" {
  name     = var.resource_group_name
  location = var.resource_group_location
}
