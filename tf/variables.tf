provider "azurerm" {
  subscription_id = "${var.subscription_id}"
  client_id = "${var.client_id}"
  client_secret = "${var.client_secret}"
  tenant_id = "${var.tenant_id}"
  features {}
}


variable "app_settings" {
    description = "A key-value pair of App Settings"
    default     = {
        "FUNCTIONS_EXTENSION_VERSION" = "~3"        
    }
}


variable "subscription_id" {
  description = "Subscription id for provisioning resources in Azure"
}


variable "client_id" {
  description = "client_id  for provisioning resources in Azure"
}



variable "client_secret" {
  description = "client_secret  for provisioning resources in Azure"
}



variable "tenant_id" {
  description = "tenant_id for provisioning resources in Azure"
}