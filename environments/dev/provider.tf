terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.41.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "ansh_rg1"
    storage_account_name = "anshstg12345"
    container_name       = "anshblob"
    key                  = "dev1.tfstate"
  }
}



provider "azurerm" {
  features {}
  subscription_id = "77312bdf-fff4-4e77-9d06-5e69870a682c"
}
