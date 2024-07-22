resource "null_resource" "ping_test" {
  count = 2

  provisioner "remote-exec" {
    connection {
      type        = "ssh"
      user        = "adminuser"
      password    = random_password.password.result
      host        = element(azurerm_public_ip.mtc-ip[*].ip_address, count.index)
    }

    inline = [
      "echo ping successful"
    ]
  }
}