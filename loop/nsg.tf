resource "azurerm_network_security_group" "training" {
  name                = "terraform-nsg"
  location            = azurerm_resource_group.training.location
  resource_group_name = azurerm_resource_group.training.name

  security_rule {
    name                       = "ssh"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "http"
    priority                   = 101
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_network_interface_security_group_association" "training" {
  for_each                  = toset(var.vm_names)
  network_interface_id      = azurerm_network_interface.training[each.value].id
  network_security_group_id = azurerm_network_security_group.training.id
}
