resource "azurerm_cognitive_account" "openai" {
  name                = var.azure_openai_studio_name
  resource_group_name = var.resource_group_name
  location            = var.location
  kind                = "OpenAI"
  sku_name            = "S0"

  custom_subdomain_name = var.azure_openai_studio_name
  dynamic_throttling_enabled = false
  public_network_access_enabled = true

  network_acls {
    default_action = "Allow"
    ip_rules       = []
  }

  tags = {}
}

resource "azurerm_cognitive_deployment" "gpt4_deployment" {
  name                = var.model_resource_name
  cognitive_account_id = azurerm_cognitive_account.openai.id
  model {
    format  = "OpenAI"
    name    = var.model_name
    version = "2024-11-20"
  }
  sku {
    name = "GlobalStandard"
    capacity = 10
  }
  dynamic_throttling_enabled = false
  rai_policy_name            = "Microsoft.DefaultV2"
}