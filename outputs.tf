# Outputs for the Terraform module

output "bastion_host_name" {
    value = azurerm_bastion_host.bastion.name
}

output "bastion_host_id" {
    value = azurerm_bastion_host.bastion.id
}