#!/usr/bin/env bash

# This script is used to automate and run terraform apply

# Set variables
export TF_VAR_bastion_rg_name="example-rg"
export TF_VAR_bastion_vnet_name="example-vnet"
export TF_VAR_bastion_subnet_name="AzureBastionSubnet"
export TF_VAR_bastion_pip_name="example-bastionPIP"
export TF_VAR_bastion_name="autoBastion"
export TF_VAR_bastion_ip_configuration_name="example-bastionIpConfig"


# Start of deployment
echo "Running ezBastion automation script"

# cd to the directory containing the terraform files
cd ..

# Run terraform commands
terraform init
terraform apply -auto-approve

# Finish deployment
echo "Finished ezBastion automation script"

# Unset variables
unset TF_VAR_bastion_resource_group_name
unset TF_VAR_bastion_vnet_name
unset TF_VAR_bastion_subnet_name
unset TF_VAR_bastion_pip_name

