
#Add index.html to blob storage
resource "azurerm_storage_blob" "arun-func-clientapp-blob" {
  name                   = "index.html"
  storage_account_name   = azurerm_storage_account.aks_fn_rg_static_site.name
  storage_container_name = "$web"
  type                   = "Block"
  content_type           = "text/html"
  source_content         = "<h1>This is static content coming from the Terraform</h1>"
}


