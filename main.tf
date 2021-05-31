terraform {
 required_version = "> 0.12.0"
}
# Configure the Azure provider
provider "azurerm" { 
 # The "feature" block is required for AzureRM provider 2.x. 
 # If you are using version 1.x, the "features" block is not allowed.
 version = "~>2.0"
 features {}
}
variable "resource_group_name" {
 default = "my-rg"
 description = "The name of the resource group"
}
variable "resource_group_location" {
 default = "westus"
 description = "The location of the resource group"
}
variable "app_service_plan_name" {
 default = "my-asp"
 description = "The name of the app service plan"
}
variable "app_service_name_prefix" {
 default = "my-appsvc"
 description = "The beginning part of the app service name"
}
resource "random_integer" "app_service_name_suffix" {
 min = 1000
 max = 9999
}
#Creating a Resource Group
resource "azurerm_resource_group" "my" {
 name = var.resource_group_name
 location = var.resource_group_location
}
