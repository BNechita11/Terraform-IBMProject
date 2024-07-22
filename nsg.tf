resource "azurerm_network_security_group" "mtc-nsg" {
  name                = "mtc-nsg"
  resource_group_name = azurerm_resource_group.mtc-rg.name
  location            = azurerm_resource_group.mtc-rg.location

  security_rule {
    name                       = "Allow-SSH"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "Allow-HTTP"
    priority                   = 1002
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags = {
    environment = "dev"
  }
}

resource "azurerm_network_interface_security_group_association" "mtc-nisg" {
  count                    = 2
  network_interface_id     = element(azurerm_network_interface.mtc-nic[*].id, count.index)
  network_security_group_id = azurerm_network_security_group.mtc-nsg.id
}
