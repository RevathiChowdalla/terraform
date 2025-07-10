output "vm_public_ips" {
  value = [for ip in azurerm_public_ip.training : ip.ip_address]
}
