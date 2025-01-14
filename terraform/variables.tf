variable "resource_group_name" {
  default = "example-resource-group"
}

variable "location" {
  default = "East US"
}

variable "client_id" {
    default = "3dbe2792-7ac9-44e7-a0db-c906c5793077"
}

variable "tenant_id" {
    default = "7c35a675-f206-43e5-85bf-7f1eccae0d20"
}

variable "TENANT_ID" {}
variable "CLIENT_ID"{}
variable "SUBSCRIPTION_ID" {}

# variable "client_id" {
#   description = "Azure Client ID"
#   type        = string
# }

# variable "client_secret" {
#   description = "Azure Client Secret"
#   type        = string
#   sensitive   = true
# }

# variable "tenant_id" {
#   description = "Azure Tenant ID"
#   type        = string
# }