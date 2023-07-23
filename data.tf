data "azurerm_resource_group" "rg" {
  name = var.bastion_rg_name
}

data "azurerm_virtual_network" "vnet" {
  name                = var.bastion_vnet_name
  resource_group_name = data.azurerm_resource_group.rg.name
}

data "azurerm_subnet" "subnet" {
  name                 = var.bastion_subnet_name
  virtual_network_name = data.azurerm_virtual_network.vnet.name
  resource_group_name  = data.azurerm_resource_group.rg.name
}

data "azurerm_public_ip" "pip" {
  name                = var.bastion_pip_name
  resource_group_name = data.azurerm_resource_group.rg.name
}
