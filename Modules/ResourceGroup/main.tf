resource "azurerm_resource_group" "rg" {
  name     = var.azurerm_resource_group_name
  location = var.location
  #tags      = var.tags
}