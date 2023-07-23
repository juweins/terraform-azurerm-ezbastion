variable "rg_name" {
    type = string
    description = "Name of the resource group"
}

variable "vnet_name" {
    type = string
    description = "Name of the virtual network"
}

variable "subnet_name" {
    type = string
    description = "Name of the subnet"
}

variable "pip_name" {
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
    description = "SKU of the bastion host, defaults to Basic"
    default = "Basic"
}