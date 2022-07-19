
resource "azurerm_function_app" "aks-fn-rg" {
  name                       = "product-details-orchestrator"
  location                   = azurerm_resource_group.aks-fn-rg.location
  resource_group_name        = azurerm_resource_group.aks-fn-rg.name
  app_service_plan_id        = azurerm_app_service_plan.aks-fn-rg.id
  storage_account_name       = azurerm_storage_account.aks_fn_rg_sa.name
  storage_account_access_key = azurerm_storage_account.aks_fn_rg_sa.primary_access_key
  app_settings              = "${var.app_settings}"

  

}
