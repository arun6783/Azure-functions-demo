# Terraform Block
terraform {
  required_version = ">= 1.0.0"
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = ">= 2.0"                   
    }
  }
}
resource "azurerm_resource_group" "arun-func-demo-rg" {
  name     = "arun-func-demo-rg"
  location = "West Europe"
}

resource "azurerm_storage_account" "arun-func-demo-rg" {
  name                     = "arunfuncdemosa"
  resource_group_name      = azurerm_resource_group.arun-func-demo-rg.name
  location                 = azurerm_resource_group.arun-func-demo-rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_app_service_plan" "arun-func-demo-rg" {
  name                = "arun-func-demo-svc-plan"
  location            = azurerm_resource_group.arun-func-demo-rg.location
  resource_group_name = azurerm_resource_group.arun-func-demo-rg.name
  kind                = "FunctionApp"

  sku {
    tier = "Dynamic"
    size = "Y1"
  }
}

resource "azurerm_function_app" "arun-func-demo-rg" {
  name                       = "product-details-orchestrator"
  location                   = azurerm_resource_group.arun-func-demo-rg.location
  resource_group_name        = azurerm_resource_group.arun-func-demo-rg.name
  app_service_plan_id        = azurerm_app_service_plan.arun-func-demo-rg.id
  storage_account_name       = azurerm_storage_account.arun-func-demo-rg.name
  storage_account_access_key = azurerm_storage_account.arun-func-demo-rg.primary_access_key
  app_settings              = "${var.app_settings}"

  

}



#Create Storage account
resource "azurerm_storage_account" "arunfuncclientappsa" {
  name                = "arunfuncclientappsa"
   resource_group_name      = azurerm_resource_group.arun-func-demo-rg.name
   location                 = azurerm_resource_group.arun-func-demo-rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind             = "StorageV2"
 
  static_website {
    index_document = "index.html"
  }
}
 
#Add index.html to blob storage
resource "azurerm_storage_blob" "arun-func-clientapp-blob" {
  name                   = "index.html"
  storage_account_name   = azurerm_storage_account.arunfuncclientappsa.name
  storage_container_name = "$web"
  type                   = "Block"
  content_type           = "text/html"
  source_content         = "<h1>This is static content coming from the Terraform</h1>"
}


# #create storage account for static website hosting


# #Create Storage account
# resource "azurerm_storage_account" "arun-func-clientapp-sa" {
#   name                = "arunazfuncclientappsa"
#   resource_group_name      = azurerm_resource_group.arun-func-demo-rg.name
#   location                 = azurerm_resource_group.arun-func-demo-rg.location
#   account_tier             = "Standard"
#   account_replication_type = "LRS"
#   account_kind             = "StorageV2"
 
#   static_website {
#     index_document = "index.html"
#   }
# }

# #Add index.html to blob storage
# resource "azurerm_storage_blob" "example" {
#   name                   = "index.html"
#   storage_account_name   = azurerm_storage_account.arun-func-clientapp-sa.name
#   storage_container_name = "$web"
#   type                   = "Block"
# }
