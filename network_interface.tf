resource "azurerm_network_interface" "mtc-nic" {
  count               = 2
  name                = "mtc-nic-${count.index}"
  location            = azurerm_resource_group.mtc-rg.location
  resource_group_name = azurerm_resource_group.mtc-rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.mtc-subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = element(azurerm_public_ip.mtc-ip[*].id, count.index)
  }

  tags = {
    environment = "dev"
  }
}
