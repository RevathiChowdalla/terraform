output "vm-public-ip" {
  value = azurerm_linux_virtual_machine.training[*].public_ip_address
}
