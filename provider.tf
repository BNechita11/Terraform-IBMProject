terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.91.0"
    }
  }
  backend "azurerm" {
    resource_group_name   = "mtc-resources"
    storage_account_name  = "ibmstorageaccount1"
    container_name        = "tfstate"
    key                   = "prod.terraform.tfstate"
    subscription_id       = "b24d5b07-a893-4e2b-b110-471ce5cd43ea"
  }
}

provider "azurerm" {
  features {}
}
