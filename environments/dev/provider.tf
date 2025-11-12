terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.41.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "dev-rg-back-ansh"
    storage_account_name = "aksstg1-anshg"
    container_name       = "akscontaineransh"
    key                  = "dev.tfstate"
  }
}

provider "azurerm" {
  features {}
  subscription_id = "b1905f95-a2fa-411c-8afb-c515e3b94481"
}
