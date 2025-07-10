terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.35.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "terraformstate"
    storage_account_name = "revathitfstate2609"
    container_name       = "tfstate"
    key                  = "state.tfstate"
  }
}

provider "azurerm" {
  features {}
}
