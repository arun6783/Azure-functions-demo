provider "azurerm" {
  subscription_id = "${var.subscription_id}"
  client_id = "${var.client_id}"
  client_secret = "${var.client_secret}"
  tenant_id = "${var.tenant_id}"
  features {}
}

provider "azuread" {
   client_id = "${var.client_id}"
  tenant_id = "${var.tenant_id}"
    client_secret = "${var.client_secret}"
}

variable "location"{
  description = "Azure Region where all these resources will be provisioned"
  default =  "West Europe"
}

variable "resource_group_name" {
  description = "variable to define resource_group_name"
  default = "aks-fn-rg"
}

variable "az_function_sa_name" {
  description = "variable to define storage account name for azure function"
  default = "arunaksfndemofnsa"
}

variable "az_function_splan_name" {
  description = "variable to define service plan name for azure function"
  default = "aks-fn-svc-plan"
}



variable "app_settings" {
    description = "A key-value pair of App Settings"
    default  = {
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


variable "ssh_public_key" {
  default = "C:\\Users\\devopsleaner\\.ssh\\aks-prod-sshkeys-terraform\\aksprodsshkey.pub"
  description = "This variable defines the SSH Public Key for Linux k8s Worker nodes"  
}

# Windows Admin Username for k8s worker nodes
variable "windows_admin_username" {
  type = string
  default = "azureuser"
  description = "This variable defines the Windows admin username k8s Worker nodes"  
}

# Windows Admin Password for k8s worker nodes
variable "windows_admin_password" {
  type = string
  default = "4iX$pI3#*3jmR*"
  description = "This variable defines the Windows admin password k8s Worker nodes"  
}