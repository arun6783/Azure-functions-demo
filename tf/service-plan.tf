
resource "azurerm_app_service_plan" "aks-fn-rg" {
  name                = var.az_function_splan_name
  location            = azurerm_resource_group.aks-fn-rg.location
  resource_group_name = azurerm_resource_group.aks-fn-rg.name
  kind                = "FunctionApp"

  sku {
    tier = "Dynamic"
    size = "Y1"
  }
}