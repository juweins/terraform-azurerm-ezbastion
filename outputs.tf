# Outputs for the Terraform module

output "bastion_host_name" {
  value       = azurerm_bastion_host.bastion.name
  description = "Name of the bastion host"
}

output "bastion_host_id" {
  value       = azurerm_bastion_host.bastion.id
  description = "ID of the bastion host"
}

output "bastion_dns_name" {
  value       = azurerm_bastion_host.bastion.dns_name
  description = "FQDN name for the bastion host"
}

output "bastion_host_ip_configuration_subnet_id" {
  value       = azurerm_bastion_host.bastion.ip_configuration.0.subnet_id
  description = "ID of the subnet where the bastion host is deployed"
}

output "bastion_sku" {
  value       = azurerm_bastion_host.bastion.sku
  description = "SKU of the bastion host; Basic or Standard"
}

output "bastion_copy_paste_enabled" {
  value       = azurerm_bastion_host.bastion.copy_paste_enabled
  description = "Copy/Paste enabled for the bastion host"
}

output "bastion_scale_units" {
  value       = azurerm_bastion_host.bastion.scale_units
  description = "Number of scale units for the bastion host; Requires Standard SKU if > 2"
}

output "bastion_sharable_link_enabled" {
  value       = azurerm_bastion_host.bastion.shareable_link_enabled
  description = "Sharable links enabled for the bastion host"
}

output "bastion_tunneling_enabled" {
  value       = azurerm_bastion_host.bastion.tunneling_enabled
  description = "Tunneling enabled for the bastion host"
}

output "bastion_tags" {
  value = azurerm_bastion_host.bastion.tags
}


