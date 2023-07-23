# Azure Bastion Host Automation Module

[![CHANGELOG](https://img.shields.io/badge/changelog-release-green.svg)](CHANGELOG.md) [![COPYRIGHT](https://img.shields.io/badge/notice-copyright-yellow.svg)](NOTICE) [![MIT LICENSE](https://img.shields.io/badge/license-MIT-orange.svg)](LICENSE) [![REGISTRY](https://img.shields.io/badge/terraform-registry-blue.svg)](https://registry.terraform.io/modules/juweins/ezbastion/azurerm/)

This module deploys an Azure Bastion Host in a dedicated subnet and a public IP address. It is intended to be automated via a CI/CD pipeline or other automation tooling (e.g. shell script, PowerShell script, etc.)

## Module Usage

```hcl
module "azure_bastion_host" {
  source = "juweins/ezbastion/azurerm"

  resource_group_name = "my-resource-group"
  vnet_name           = "my-vnet"
  subnet_name         = "AzureBastionSubnet"
  pip_name            = "my-public-ip"
  bastion_name        = "my-bastion-host"
  bastion_ip_configuration_name = "my-bastion-host-ip-configuration"
}
```

## Why use this module?

Azure does not provide a way to pause / deallocate a Bastion Host. Since this service is billed hourly, it can be costly to leave it running when not in use. This module provides a way to automate the deployment and removal of a Bastion Host. This is useful for any environments where the Bastion Host is not needed 24/7.

## Pre-requisites

In order to use this module, you need a existing virtual network with at least one subnet. The subnet must be named `AzureBastionSubnet` in accordance to azures' requirements. This module references a existing and free public IP for the Bastion Host.

## Module Inputs

### Mandatory Inputs

| Name | Type | Default | Description |
|------|------|---------|-------------|
| resource_group_name | string | n/a | The name of the resource group where the Bastion Host will be deployed |
| vnet_name | string | n/a | The name of the virtual network where the Bastion Host will be deployed |
| subnet_name | string | n/a | The name of the subnet where the Bastion Host will be deployed |
| pip_name | string | n/a | The name of the public IP address that will be used for the Bastion Host |
| bastion_name | string | n/a | The name for the Bastion Host |
| bastion_ip_configuration_name | string | n/a | The name fore the IP configuration of the Bastion Host |

### Optional Inputs (Bastion Configuration)

| Name | Type | Default | Description |
|------|------|---------|-------------|
| bastion_sku | string | Standard | The SKU for the Bastion Host. Allowed values are Basic and Standard |
| bastion_scale_units | number | 2 | The number of scale units for the Bastion Host. More than 2 requires Standard SKU |
| bastion_shareable_link_enabled | bool | false | Enable shareable link functionality for the Bastion Host |
| bastion_tunneling_enabled | bool | false | Enable tunneling functionality for the Bastion Host |
| bastion_tags | map | {environment = "dev"} | Tags to be applied to the Bastion Host |

## Module Outputs

| Name | Type | Description |
|------|------|-------------|
| bastion_host_name | string | The name of the Bastion Host |
| bastion_host_id | string | The ID of the Bastion Host |
| bastion_dns_name | string | The FQDN of the Bastion Host |
| bastion_host_ip_configuration_subnet_id | string | The ID of the subnet for the Bastion Host |
| bastion_sku | string | The SKU of the Bastion Host |
| bastion_scale_units | number | The number of scale units for the Bastion Host |
| bastion_shareable_link_enabled | bool | The shareable link functionality for the Bastion Host |
| bastion_tunneling_enabled | bool | The tunneling functionality for the Bastion Host |
| bastion_tags | map | The tags applied to the Bastion Host |

# Automation examples

To automate the deployment and removal of the Bastion Host, you can use examples that will be provided in the [examples](examples) directory shortly.

# Contributing
Contributions are highly welcome!

# Authors
[Julian Weins](https://julianweins.dev/about)

# License
[MIT](LICENSE)

# References
- [Azure Bastion](https://docs.microsoft.com/en-us/azure/bastion/bastion-overview)
- [Azure Bastion pricing](https://azure.microsoft.com/en-us/pricing/details/azure-bastion/)
- [Azure Bastion FAQ](https://docs.microsoft.com/en-us/azure/bastion/bastion-faq)
- [Azure Bastion documentation](https://docs.microsoft.com/en-us/azure/bastion/)



