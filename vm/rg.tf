locals {
  rg_name = {
    dev     = "development"
    test    = "testing"
    prod    = "production"
    default = "terraform"
  }
}

resource "azurerm_resource_group" "training" {
  name     = local.rg_name[terraform.workspace]
  location = var.resource_group_location
}
