resource "azurerm_linux_virtual_machine" "training" {
  name                = "terraform"
  resource_group_name = azurerm_resource_group.training.name
  location            = azurerm_resource_group.training.location
  size                = var.vm_size
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  disable_password_authentication = false
  custom_data         = base64encode(var.custom_data_script)
  network_interface_ids = [
    azurerm_network_interface.training.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "ubuntu-24_04-lts"
    sku       = "server"
    version   = "latest"
  }

  boot_diagnostics {
    storage_account_uri = azurerm_storage_account.training.primary_blob_endpoint
  }
}
