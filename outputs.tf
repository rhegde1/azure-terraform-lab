# output "resource_group_name" {
#   value = data.azurerm_resource_group.acs_demo_rg.name
# }

output "public_ip_address" {
  value = azurerm_windows_virtual_machine.main.public_ip_address
}

# output "admin_password" {
#   sensitive = true
#   value     = azurerm_windows_virtual_machine.main.admin_password
# }

# output "id" {
#   value = data.azurerm_resource_group.acs_demo_rg.id
# }
