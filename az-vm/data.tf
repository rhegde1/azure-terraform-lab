data "azurerm_resource_group" "acs_demo_rg" {
  name = "acs-tf-demo"
}

data "azurerm_virtual_network" "acs_demo_vnet" {
  name                = "acs-tf-demo-vnet"
  resource_group_name = data.azurerm_resource_group.acs_demo_rg.name
}

data "azurerm_network_security_group" "acs_demo_nsg" {
  name                = "acs-tf-demo-nsg"
  resource_group_name = data.azurerm_resource_group.acs_demo_rg.name
}

data "azurerm_subnet" "acs_demo_subnet" {
  name                 = "acs-tf-demo-subnet1"
  virtual_network_name = data.azurerm_virtual_network.acs_demo_vnet.name
  resource_group_name  = data.azurerm_resource_group.acs_demo_rg.name
}
