terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.57.0"
    }
  }
}

provider "azurerm" {
  features {}
}

# Application-specific resource group
resource "azurerm_resource_group" "app" {
  name     = "rg-app1-prod-app"
  location = "eastus"

  tags = {
    Application = "app1"
    Environment = "prod"
  }
}

module "vnet" {
  source = "git::https://github.com/seera-eswara/terraform-azure-modules.git//modules/vnet?ref=f94383044a37da515aa0557225aa00825f96ccf4"

  name     = "app1-vnet"
  location = "eastus"
}

module "aks" {
  source = "git::https://github.com/seera-eswara/terraform-azure-modules.git//modules/aks?ref=f94383044a37da515aa0557225aa00825f96ccf4"

  private_cluster = true
  sku_tier        = "Standard"
}
