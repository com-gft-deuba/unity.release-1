# #Azure Client Information (to be used if needed to get infos like Subscription ID and so on)
# data "azurerm_client_config" "current" {
# }
# 
# #The Resource Group
# data "azurerm_resource_group" "master" {
#   name     = local.customer
# }
# 
# data "azurerm_storage_account" "master" {
#   name                     = local.master_storage_account_name
#   resource_group_name      = data.azurerm_resource_group.master.name
# }
# 
# # Container to store terraform states
# data "azurerm_storage_container" "terraformstates" {
#   name                  = local.master_signature_clean
#   storage_account_name  = data.azurerm_storage_account.master.name
# }

data "google_project" "master" {
}

