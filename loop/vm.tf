resource "azurerm_linux_virtual_machine" "training" {
  count               = var.vm_count
  name                = "terraform-${count.index + 1}"
  resource_group_name = azurerm_resource_group.training.name
  location            = azurerm_resource_group.training.location
  size                = var.vm_size
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  disable_password_authentication = false
  custom_data         = base64encode(var.custom_data_script)

  network_interface_ids = [
    azurerm_network_interface.training[count.index].id,
  ]

  os_disk {
    name                 = "terraformosdisk-${count.index + 1}"
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
