# # Create public IPs
# resource "azurerm_public_ip" "acs_tf_demo_public_ip" {
#   name                = "${random_pet.prefix.id}-public-ip"
#   location            = data.azurerm_resource_group.acs_demo_rg.location
#   resource_group_name = data.azurerm_resource_group.acs_demo_rg.name
#   allocation_method   = "Dynamic"
# }

# # Create Network Security rules and assign to existing NSG
# resource "azurerm_network_security_rule" "acs_demo_rdp_rule" {
#   name                        = "RDP"
#   priority                    = 1000
#   direction                   = "Inbound"
#   access                      = "Allow"
#   protocol                    = "*"
#   source_port_range           = "*"
#   destination_port_range      = "3389"
#   source_address_prefix       = "*"
#   destination_address_prefix  = "*"
#   resource_group_name         = data.azurerm_resource_group.acs_demo_rg.name
#   network_security_group_name = data.azurerm_network_security_group.acs_demo_nsg.name
# }
# resource "azurerm_network_security_rule" "acs_demo_web_rule" {
#   name                        = "web"
#   priority                    = 1001
#   direction                   = "Inbound"
#   access                      = "Allow"
#   protocol                    = "Tcp"
#   source_port_range           = "*"
#   destination_port_range      = "80"
#   source_address_prefix       = "*"
#   destination_address_prefix  = "*"
#   resource_group_name         = data.azurerm_resource_group.acs_demo_rg.name
#   network_security_group_name = data.azurerm_network_security_group.acs_demo_nsg.name
# }

# # Create network interface
# resource "azurerm_network_interface" "acs_tf_demo_nic" {
#   name                = "${random_pet.prefix.id}-nic"
#   location            = data.azurerm_resource_group.acs_demo_rg.location
#   resource_group_name = data.azurerm_resource_group.acs_demo_rg.name

#   ip_configuration {
#     name                          = "my_nic_configuration"
#     subnet_id                     = data.azurerm_subnet.acs_demo_subnet.id
#     private_ip_address_allocation = "Dynamic"
#     public_ip_address_id          = azurerm_public_ip.acs_tf_demo_public_ip.id
#   }
# }

# # Connect the security group to the network interface
# resource "azurerm_network_interface_security_group_association" "acs_tf_demo_nic_association" {
#   network_interface_id      = azurerm_network_interface.acs_tf_demo_nic.id
#   network_security_group_id = data.azurerm_network_security_group.acs_demo_nsg.id
# }

# # Create storage account for boot diagnostics
# resource "azurerm_storage_account" "my_storage_account" {
#   name                     = "diag${random_id.random_id.hex}"
#   location                 = data.azurerm_resource_group.acs_demo_rg.location
#   resource_group_name      = data.azurerm_resource_group.acs_demo_rg.name
#   account_tier             = "Standard"
#   account_replication_type = "LRS"
# }


# # Create virtual machine
# resource "azurerm_windows_virtual_machine" "main" {
#   name                  = "${var.prefix}-vm"
#   admin_username        = "azureuser"
#   admin_password        = random_password.password.result
#   location              = data.azurerm_resource_group.acs_demo_rg.location
#   resource_group_name   = data.azurerm_resource_group.acs_demo_rg.name
#   network_interface_ids = [azurerm_network_interface.acs_tf_demo_nic.id]
#   size                  = "Standard_DS1_v2"

#   os_disk {
#     name                 = "myOsDisk"
#     caching              = "ReadWrite"
#     storage_account_type = "Premium_LRS"
#   }

#   source_image_reference {
#     publisher = "MicrosoftWindowsServer"
#     offer     = "WindowsServer"
#     sku       = "2022-datacenter-azure-edition"
#     version   = "latest"
#   }


#   boot_diagnostics {
#     storage_account_uri = azurerm_storage_account.my_storage_account.primary_blob_endpoint
#   }
# }

# # Install IIS web server to the virtual machine
# resource "azurerm_virtual_machine_extension" "web_server_install" {
#   name                       = "${random_pet.prefix.id}-wsi"
#   virtual_machine_id         = azurerm_windows_virtual_machine.main.id
#   publisher                  = "Microsoft.Compute"
#   type                       = "CustomScriptExtension"
#   type_handler_version       = "1.8"
#   auto_upgrade_minor_version = true

#   settings = <<SETTINGS
#     {
#       "commandToExecute": "powershell -ExecutionPolicy Unrestricted Install-WindowsFeature -Name Web-Server -IncludeAllSubFeature -IncludeManagementTools"
#     }
#   SETTINGS
# }

# # Generate random text for a unique storage account name
# resource "random_id" "random_id" {
#   keepers = {
#     # Generate a new ID only when a new resource group is defined
#     resource_group = data.azurerm_resource_group.acs_demo_rg.name
#   }

#   byte_length = 8
# }

# resource "random_password" "password" {
#   length      = 20
#   min_lower   = 1
#   min_upper   = 1
#   min_numeric = 1
#   min_special = 1
#   special     = true
# }

# resource "random_pet" "prefix" {
#   prefix = var.prefix
#   length = 1
# }
