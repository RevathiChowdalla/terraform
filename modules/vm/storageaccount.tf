resource "random_id" "training" {
  keepers = {
    # Generate a new id only when a new resource group is created
    resource_group = azurerm_resource_group.training.name
  }

  byte_length = 8
}

resource "azurerm_storage_account" "training" {
  name                     = "diagnos${random_id.training.hex}"
  resource_group_name      = azurerm_resource_group.training.name
  location                 = azurerm_resource_group.training.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
