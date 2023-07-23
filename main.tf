# Create a Bastion inside your existing target VNet and Subnet
#
# Assumptions:
# - Existing Resource Group
# - Existing VNet, e.g. in hub-spoke 
# - Existing Subnet (Required Name: AzureBastionSubnet)
# - Existing Public IP to be used for the Bastion
# --------------------------------------------------

resource "azurerm_bastion_host" "bastion" {
  name                = var.bastion_name
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name

  ip_configuration {
    name                 = var.bastion_ip_configuration_name
    subnet_id            = data.azurerm_subnet.subnet.id
    public_ip_address_id = data.azurerm_public_ip.pip.id
  }

  # Optional Configuration
  sku         = var.bastion_sku
  scale_units = var.bastion_scale_units

  copy_paste_enabled      = var.bastion_copy_paste_enabled
  shareable_link_enabled = var.bastion_shareable_link_enabled
  tunneling_enabled       = var.bastion_tunneling_enabled
}
