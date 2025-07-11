terraform { 
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.35.0"
    }
    random = {
      source = "hashicorp/random"
      version = "3.7.2"
    }
    null = {
      source = "hashicorp/null"
      version = "3.2.4"
    }
  }
  backend "azurerm" {
    resource_group_name = "terraformstate"
    storage_account_name = "revathitfstate2609"
    container_name       = "tfstate"
    key                  = "linuxvm.tfstate"
  }
}

provider "azurerm" {
  features {}
}
