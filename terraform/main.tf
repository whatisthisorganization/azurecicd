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
  client_id       = var.client_id
  tenant_id       = var.tenant_id
}

resource "azurerm_resource_group" "rg" {
  name     = "example-resource-group"
  location = "East US"
}

resource "azurerm_storage_account" "sa" {
  name                     = "mystrgforgithubtest543"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_cognitive_account" "openai" {
  name                = "azureaistudiotest543"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  kind                = "OpenAI"
  sku_name            = "S0"

  custom_subdomain_name = "azureaistudiotest543"
  dynamic_throttling_enabled = false
  public_network_access_enabled = true

  network_acls {
    default_action = "Allow"
    ip_rules       = []
  }

  tags = {}
}

resource "azurerm_cognitive_deployment" "gpt4_deployment" {
  name                = "gpt-4o"
  cognitive_account_id = azurerm_cognitive_account.openai.id
  model {
    format  = "OpenAI"
    name    = "gpt-4o"
    version = "2024-11-20"
  }
  sku {
    name = "GlobalStandard"
    capacity = 10
  }
  dynamic_throttling_enabled = false
  rai_policy_name            = "Microsoft.DefaultV2"
}

