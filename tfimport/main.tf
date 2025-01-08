provider "azurerm" {
  features {}
}

resource "azurerm_cognitive_account" "openai" {
  name                = "azureaistudiotest"
  resource_group_name = "example-resource-group"
  location            = "East US"
  kind                = "OpenAI"
  sku_name            = "S0"
}