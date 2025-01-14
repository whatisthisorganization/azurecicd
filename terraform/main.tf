terraform {
  backend "azurerm" {
    resource_group_name  = "terraform-statefile-rg-dev"
    storage_account_name = "tfstatefilewesteuropedev"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {}

  subscription_id = var.SUBSCRIPTION_ID
  client_id       = var.CLIENT_ID
  tenant_id       = var.TENANT_ID
}

resource "azurerm_resource_group" "rg" {
  name     = "example-resource-group"
  location = "East US"
}

module "storage_account" {
  source                                = "./modules/storage_accounts"
  resource_group_name                   = var.resource_group_name
  name                                  = "mystrgforgithubtest543"
  location                              = var.location
  account_tier                          = "Standard"
  account_replication_type              = "LRS"
}

module "azurerm_cognitive_account" {
    source = "./modules/azure_openai_studio"
    resource_group_name = var.resource_group_name
    location = var.location
    azure_openai_studio_name = "azureaistudiotest543"
    model_name = "gpt-4o"
    model_resource_name = "gpt-4o"
}

