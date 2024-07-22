output "vm_password" {
  value     = random_password.password.result
  sensitive = true
}

output "vm_private_ips" {
  value = azurerm_network_interface.mtc-nic[*].private_ip_address
}

output "public_ips" {
  value = azurerm_public_ip.mtc-ip[*].ip_address
}