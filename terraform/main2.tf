module "storage_account" {
  source                                = "./modules/storage_accounts"
  resource_group_name                   = var.resource_group_name
  name                                  = "mystrgforgithubtest543"
  location                              = var.location
  account_tier                          = "Standard"
  account_replication_type              = "LRS"
}