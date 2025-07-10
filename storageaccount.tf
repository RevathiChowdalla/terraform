variable "create_storage_account" {
  description = "Set true if you want to create a storage account else set false"
  type        = bool
  default     = true
}

resource "azurerm_resource_group" "condition" {
  name     = "condition"
  location = "EAST US"
}

resource "random_id" "training" {
  byte_length = 8
}

resource "azurerm_storage_account" "condition" {
  count                    = var.create_storage_account ? 1 : 0
  name                     = "con${random_id.training.hex}"
  resource_group_name      = azurerm_resource_group.condition.name
  location                 = azurerm_resource_group.condition.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

output "storage_account_name" {
  value = length(azurerm_storage_account.condition) > 0 ? azurerm_storage_account.condition[0].name : "No storage account created"
}
