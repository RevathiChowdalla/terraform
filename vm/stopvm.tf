data "azurerm_virtual_machine" "existing_vm" {
  name                = azurerm_linux_virtual_machine.training.name
  resource_group_name = azurerm_resource_group.training.name
}

data "azurerm_resource_group" "existing_rg" {
  name = azurerm_resource_group.training.name
}

resource "null_resource" "stop_vm" {
  provisioner "local-exec" {
    command = "az vm deallocate --resource-group ${data.azurerm_resource_group.existing_rg.name} --name ${data.azurerm_virtual_machine.existing_vm.name}"
  }
  triggers = {
    vm_id = azurerm_linux_virtual_machine.training.size
  }
}
