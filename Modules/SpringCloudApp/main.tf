resource "azurerm_spring_cloud_app" "scapp" {
  name                = var.azurerm_spring_cloud_app_name
  resource_group_name = var.resource_group_name
  service_name        = var.service_name
}