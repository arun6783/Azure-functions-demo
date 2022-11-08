# data "azurerm_kubernetes_service_versions" "current" {
#  location            = azurerm_resource_group.aks-fn-rg.location
#   include_preview = false  
# }


# # Create Log Analytics Workspace
# resource "azurerm_log_analytics_workspace" "insights" {
#   name                = "arun-aks-fn-demo-logs-insight"
#   location            = azurerm_resource_group.aks-fn-rg.location
#   resource_group_name = azurerm_resource_group.aks-fn-rg.name
#   retention_in_days   = 30
# }


# # Create Azure AD Group in Active Directory for AKS Admins
# resource "azuread_group" "aks_administrators" {
#   name        = "${azurerm_resource_group.aks-fn-rg.name}-cluster-administrators"
#   description = "Azure AKS Kubernetes administrators for the ${azurerm_resource_group.aks-fn-rg.name}-cluster."
# }


# resource "azurerm_kubernetes_cluster" "aks_cluster" {
#   name                = "${azurerm_resource_group.aks-fn-rg.name}-cluster"
#   location            = azurerm_resource_group.aks-fn-rg.location
#   resource_group_name = azurerm_resource_group.aks-fn-rg.name
#   dns_prefix          = "${azurerm_resource_group.aks-fn-rg.name}-cluster"
#   kubernetes_version  = data.azurerm_kubernetes_service_versions.current.latest_version
#   node_resource_group = "${azurerm_resource_group.aks-fn-rg.name}-nrg"

#   default_node_pool {
#     name       = "systempool"
#     node_count = 1
#     vm_size    = "Standard_D2_v2"
#   }

#   identity {
#     type = "SystemAssigned"
#   }

#   addon_profile {

#     ingress_application_gateway {
#       enabled      = true
#       gateway_name = "aks-fn-demo-in-appgw"
#       subnet_cidr = "10.2.0.0/16"

#     }

#     http_application_routing {
#       enabled = "false"
#     }
#   }

#  tags = {
#     Environment = "dev"
#   }
# }
