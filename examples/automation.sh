#!/usr/bin/env bash

# This script is used to automate and run terraform apply/destroy
#
#   Usage: ./automation.sh [up|down|show]
#   up:    Create Bastion
#   down:  Destroy Bastion
#   show:  Display ezBastion configuration
#

# Set script variables
bold=$(tput bold)
normal=$(tput sgr0)

# Set Bastion specific variables
export TF_VAR_bastion_rg_name="example-rg"
export TF_VAR_bastion_vnet_name="example-vnet"
export TF_VAR_bastion_subnet_name="AzureBastionSubnet"
export TF_VAR_bastion_pip_name="example-bastionPIP"
export TF_VAR_bastion_name="autoBastion"
export TF_VAR_bastion_ip_configuration_name="example-bastionIpConfig"

# Create Bastion
function terraform_up() {
    terraform init
    terraform apply --auto-approve
}

# Destroy Bastion
function terraform_down() {
    terraform destroy --auto-approve
}

# Show Bastion configuration
function configuration_show() {
    echo "${bold}Resource Group   : ${normal}$TF_VAR_bastion_rg_name"
    echo "${bold}VNet             : ${normal}$TF_VAR_bastion_vnet_name"
    echo "${bold}Subnet           : ${normal}$TF_VAR_bastion_subnet_name"
    echo "${bold}Public IP        : ${normal}$TF_VAR_bastion_pip_name"
    echo "${bold}Bastion          : ${normal}$TF_VAR_bastion_name"
    echo "${bold}IP Configuration : ${normal}$TF_VAR_bastion_ip_configuration_name"
    exit 1
}

if [ "$1" = "up" ]; then
    echo "${bold}Creating Bastion... ${normal}"
    terraform_up
elif [ "$1" = "down" ]; then
    echo "${bold}Destroying Bastion... ${normal}"
    terraform_down

elif [ "$1" = "show" ]; then
    echo "${bold}ezBastion configuration"
    echo "-----------------------${normal}"
    configuration_show
else
    echo "Usage: $0 [up|down|config]"
    exit 1
fi

# cd to the directory containing the terraform files
cd ..

# Unset variables
unset TF_VAR_bastion_resource_group_name
unset TF_VAR_bastion_vnet_name
unset TF_VAR_bastion_subnet_name
unset TF_VAR_bastion_pip_name
