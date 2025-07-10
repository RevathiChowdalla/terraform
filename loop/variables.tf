variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = "terraform"
}

variable "resource_group_location" {
  description = "Location of the resource group"
  type        = string
  default     = "EAST US"
}

variable "vm_size" {
  description = "Instance Type in azure"
  type        = string
  default     = "Standard_B1s"
}

variable "admin_username" {
  description = "username for the vm"
  type        = string
  default     = "azureuser"
}

variable "admin_password" {
  description = "password for the vm"
  type        = string
  sensitive   = true
}

variable "custom_data_script" {
  description = "Script to execute during machine proviosining"
  type        = string
  default     = <<-SCRIPT
#!/bin/bash
sudo apt update
sudo apt install apache2 -y
sudo echo "Welcome to terraform training, testing chnages in custom data" > /var/www/html/index.html
sudo systemctl start apache2
sudo systemctl enable apache2
SCRIPT
}

variable "vm_count" {
  description = "Total no of vm's to be created"
  type        = number
  default     = 3
}
