#!/usr/bin/env bash

# This script is used to automate and run terraform apply/destroy
#
#   Usage: ./automation.sh [up|down|set|show]
#   up:    Create Bastion
#   down:  Destroy Bastion
#   set:   Set Terraform directory path for execution
#   show:  Display ezBastion configuration
#

# Set script variables
CONFIG_FILE="$HOME/.ezBastion"

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
    echo "${bold}Terraform Path   : ${normal}$(cat $CONFIG_FILE)"
    exit 1
}

# Set Terraform directory path to custom location
function terraform_directory() {
    echo "$1" >"$CONFIG_FILE"
    echo "Terraform directory path set to: $1"
}

if [ "$1" = "up" ]; then
    echo "${bold}Creating Bastion... ${normal}"

    # Load terraform directory path
    terraform_dir=$(cat "$CONFIG_FILE")
    # Check if the path is empty
    if [ -z "$terraform_dir" ]; then
        echo "Terraform directory path not set. Use './automate.sh set <terraform_directory>' to set it."
        exit 1
    fi
    cd "$terraform_dir" || exit 1

    # Execute Command
    terraform_up

elif [ "$1" = "down" ]; then
    echo "${bold}Destroying Bastion... ${normal}"

    # Load terraform directory path
    terraform_dir=$(cat "$CONFIG_FILE")
    # Check if the path is empty
    if [ -z "$terraform_dir" ]; then
        echo "Terraform directory path not set. Use './automate.sh set <terraform_directory>' to set it."
        exit 1
    fi
    cd "$terraform_dir" || exit 1

    # Execute Command
    terraform_down

elif [ "$1" = "show" ]; then
    echo "${bold}ezBastion configuration"
    echo "-----------------------${normal}"
    configuration_show
elif [ "$1" = "set" ]; then
    echo "${bold}Setting Terraform directory... ${normal}"
    terraform_directory $2
else
    echo "Usage: $0 [up|down|set|show]"
    exit 1
fi

# Unset variables
unset TF_VAR_bastion_resource_group_name
unset TF_VAR_bastion_vnet_name
unset TF_VAR_bastion_subnet_name
unset TF_VAR_bastion_pip_name
