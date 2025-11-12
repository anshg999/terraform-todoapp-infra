terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.41.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "dev-rg-back"
    storage_account_name = "aksstg1"
    container_name       = "akscontainer"
    key                  = "dev.tfstate"
  }
}

provider "azurerm" {
  features {}
  subscription_id = "3bafb5d4-689a-4313-b617-9f3367263cd7"
}
