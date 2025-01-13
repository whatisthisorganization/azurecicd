variable "resource_group_name" {
  default = "example-resource-group"
}

variable "location" {
  default = "East US"
}

# variable "subscription_id" {
#     default = "4713046b-1fac-4a36-a39b-0413983dc0e6"
# }
variable "client_id" {
    default = "3dbe2792-7ac9-44e7-a0db-c906c5793077"
}
variable "client_secret" {
    default = "fle8Q~gt3mxpyLNA6ckPPD0yJzT2EwAR-_m-GdBE"
}
variable "tenant_id" {
    default = "7c35a675-f206-43e5-85bf-7f1eccae0d20"
}

variable "SUBSCRIPTION_ID" {
  description = "Azure Subscription ID"
  type        = string
}

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