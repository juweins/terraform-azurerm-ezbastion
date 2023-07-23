# Azure Bastion Host Automation Module

This module deploys an Azure Bastion Host in a dedicated subnet and a public IP address. It is intended to be automated via a CI/CD pipeline or other automation tooling (e.g. shell script, PowerShell script, etc.)

## Module Usage

## Why use this module?

Azure does not provide a way to pause / deallocate a Bastion Host. Since this service is billed hourly, it can be costly to leave it running when not in use. This module provides a way to automate the deployment and removal of a Bastion Host. This is useful for any environments where the Bastion Host is not needed 24/7.

## Pre-requisites

In order to use this module, you need a existing virtual network with at least one subnet. The subnet must be named `AzureBastionSubnet` in accordance to azures' requirements. This module references a existing and free public IP for the Bastion Host.

## Module Inputs

| Name | Type | Default | Description |
|------|------|---------|-------------|
| resource_group_name | string | n/a | The name of the resource group where the Bastion Host will be deployed |
| vnet_name | string | n/a | The name of the virtual network where the Bastion Host will be deployed |
| subnet_name | string | n/a | The name of the subnet where the Bastion Host will be deployed |
| pip_name | string | n/a | The name of the public IP address that will be used for the Bastion Host |
| bastion_name | string | n/a | The name of the Bastion Host |
| bastion_ip_configuration_name | string | n/a | The name of the IP configuration for the Bastion Host |

## Module Outputs

| Name | Type | Description |
|------|------|-------------|
| bastion_host_name | string | The name of the Bastion Host |
| bastion_host_id | string | The ID of the Bastion Host |
| bastion_host_ip_configuration_id | string | The ID of the IP configuration for the Bastion Host |
| bastion_host_ip_configuration_name | string | The name of the IP configuration for the Bastion Host |

## Example Usage



# Authors
[Julian Weins](https://julianweins.dev/about)

# License
[MIT](LICENSE)

# References
- [Azure Bastion](https://docs.microsoft.com/en-us/azure/bastion/bastion-overview)
- [Azure Bastion pricing](https://azure.microsoft.com/en-us/pricing/details/azure-bastion/)
- [Azure Bastion FAQ](https://docs.microsoft.com/en-us/azure/bastion/bastion-faq)
- [Azure Bastion documentation](https://docs.microsoft.com/en-us/azure/bastion/)



