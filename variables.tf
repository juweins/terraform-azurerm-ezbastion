variable "bastion_rg_name" {
    type = string
    description = "Name of the resource group"
}

variable "bastion_vnet_name" {
    type = string
    description = "Name of the virtual network"
}

variable "bastion_subnet_name" {
    type = string
    description = "Name of the subnet"
}

variable "bastion_pip_name" {
    type = string
    description = "Name of the public IP address"
}

# Bastion Specification

variable "bastion_name" {
    type = string
    description = "Name of the bastion host"
}

variable "bastion_ip_configuration_name" {
    type = string
    description = "Name of the bastion host IP configuration"
}

variable "bastion_sku" {
    type = string
    description = "SKU of the bastion host, defaults to Basic; Basic or Standard"
    default = "Basic"
}

variable "bastion_copy_paste_enabled" {
    type = bool
    description = "Enable copy/paste functionality, defaults to true"
    default = true
}

variable "bastion_scale_units" {
    type = number
    description = "Number of scale units, defaults to 2; Requires Standard SKU if > 2"
    default = 2
}

variable "bastion_shareable_link_enabled" {
    type = bool
    description = "Enable sharable links, defaults to false"
    default = false
}

variable "bastion_tunneling_enabled" {
    type = bool
    description = "Enable tunneling, defaults to false"
    default = false
}

variable "bastion_tags"{
    type = map
    description = "Tags to be applied to the bastion host"
    default = {
        environment = "dev"
    }
}