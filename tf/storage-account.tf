#Create Storage account for function

resource "azurerm_storage_account" "aks_fn_rg_sa" {
  name                     = var.az_function_sa_name
  resource_group_name      = azurerm_resource_group.aks-fn-rg.name
  location                 = azurerm_resource_group.aks-fn-rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}



#Create Storage account for static website
resource "azurerm_storage_account" "aks_fn_rg_static_site" {
  name                = "arunfuncclientappsa"
  resource_group_name      = azurerm_resource_group.aks-fn-rg.name
  location                 = azurerm_resource_group.aks-fn-rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind             = "StorageV2"
 
  static_website {
    index_document = "index.html"
  }
}