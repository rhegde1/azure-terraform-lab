# resource "azurerm_storage_account" "acs_demo_tf_state" {
#   # (resource arguments)
#   name                     = "acsdemotfstatefile"
#   location                 = data.azurerm_resource_group.acs_demo_rg.location
#   resource_group_name      = data.azurerm_resource_group.acs_demo_rg.name
#   account_tier             = "Standard"
#   account_replication_type = "Standard_LRS"

#   tags = {
#     "env" : "demo",
#     "owner" : "Ritesh"
#   }
# }
