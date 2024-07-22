resource "azurerm_linux_virtual_machine" "mtc-vm" {
  count               = 2
  name                = "mtc-vm-${count.index}"
  resource_group_name = azurerm_resource_group.mtc-rg.name
  location            = azurerm_resource_group.mtc-rg.location
  size                = "Standard_B1s"
  admin_username      = "adminuser"
  admin_password      = random_password.password.result
  disable_password_authentication = false

  admin_ssh_key {
    username   = "adminuser"
    public_key = file("D:/IBM_practica/terraform-azure/key.pub")
  }

  network_interface_ids = [
    element(azurerm_network_interface.mtc-nic[*].id, count.index),
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  computer_name  = "hostname-${count.index}"
  tags = {
    environment = "dev"
  }
}
