resource "azurerm_resource_group" "aks-fn-rg" {
  name="${var.resource_group_name}"
    location = var.location
}