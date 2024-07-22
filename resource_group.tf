resource "azurerm_resource_group" "mtc-rg" {
  name     = "mtc-resources"
  location = "eastus2"
  tags = {
    environment = "dev"
  }
}

resource "azurerm_storage_account" "storage" {
  name                     = "ibmstorageaccount1"
  resource_group_name      = azurerm_resource_group.mtc-rg.name
  location                 = azurerm_resource_group.mtc-rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "tfstate" {
  name                  = "tfstate"
  storage_account_name  = azurerm_storage_account.storage.name
  container_access_type = "private"
}
