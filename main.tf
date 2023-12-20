terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.43.0"
    }
  }

  cloud {
    organization = "co-lab-env"

    workspaces {
      name = "Hands-On_With_Terraform_On_Azure"
    }
  }
}

provider "azurerm" {
  features {}
  skip_provider_registration = true
}

resource "azurerm_resource_group" "rg" {
  name     = "813-3da353c0-hands-on-with-terraform-on-azure"
  location = "southcentralus"

}

module "securestorage" {
  source   = "app.terraform.io/co-lab-env/securestorage/azurerm"
  version  = "1.0.0"
  location = azurerm_resource_group.rg.location
  # insert required variables here
  resource_group_name  = azurerm_resource_group.rg.name
  storage_account_name = "stg7676a"
}

# What is the issue?