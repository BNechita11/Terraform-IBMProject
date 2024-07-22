resource "azurerm_public_ip" "mtc-ip" {
  count               = 2
  name                = "mtc-ip-${count.index}"
  resource_group_name = azurerm_resource_group.mtc-rg.name
  location            = azurerm_resource_group.mtc-rg.location
  allocation_method   = "Dynamic"

  tags = {
    environment = "dev"
  }
}