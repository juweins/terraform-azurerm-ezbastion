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

Azure does not provide a way to pause / deallocate a Bastion Host. Since this service is billed hourly, it can be costly to leave it running when not in use. This module provides a first step to automate the deployment and removal of a Bastion Host. This is useful for any environments where the Bastion Host is not needed 24/7.

## Pre-requisites

In order to use this module, ensure you have already deployed:
- 1 resource group
- 1 virtual network
- 1 subnet
- 1 public IP address (Standard SKU)

## Module Inputs

The following inputs are supported:

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

## 1. Automate via shell script

The provided shell script will enable you to automatically deploy and remove your bastion host via the commands `./automation.sh up` and `./automation.sh down`. The script will use the [Terraform CLI](https://www.terraform.io/downloads.html) to deploy and remove the Bastion Host.

### Prerequisites

#### Make the script executable:

```bash
chmod +x automation.sh
```

#### Install Terraform
Ensure you have the [Terraform CLI](https://www.terraform.io/downloads.html) installed.

#### Configure the script
In order to work properly you have to set your path to the location where your ezBastion directory resides. This is in case you store the shell script outside the module directory. If you store the shell script inside the module directory, you can set the value to **..** .

> Note: I assume that you store the script e.g. in your home directory, but leave the configuration in another directoery. This way, terraform commands inside the script will find the ezBastion module.

```bash
./automation.sh set ..
```

#### Set up your environment variables

You need to set the TF_VAR_* inside the script to point to your actual resources. Since the module only creates the bastion service and references all other required resources, these must be present before running the script.

For this reason replace the TF_VAR_* variables in the script with your actual values.

```bash
nano automation.sh
```

```bash
# Set your environment variables here
export TF_VAR_bastion_resource_group_name="my-resource-group"
export TF_VAR_bastion_vnet_name="my-vnet"
export TF_VAR_bastion_subnet_name="AzureBastionSubnet"
export TF_VAR_bastion_pip_name="my-public-ip"
export TF_VAR_bastion_name="my-bastion-host"
export TF_VAR_bastion_ip_configuration_name="my-bastion-host-ip-configuration"
```

> Note: These variables have a prefix 'bastion' to avoid overriding your existing environment variables. The TF_VAR_ will also be unset at the end of the script to avoid any side effects.




### Usage

#### Deploy the Bastion Host

```bash
./automation.sh up
```

#### Remove the Bastion Host

```bash
./automation.sh down
```

## 2. Automate via Azure DevOps pipeline / Github Actions

**feature coming soon**

## 3. #Automate via CLI Tool

**feature coming soon**





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



