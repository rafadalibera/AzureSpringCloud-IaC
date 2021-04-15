resource "azurerm_spring_cloud_service" "scs" {
  name                = var.azurerm_spring_cloud_service_name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku_name            = var.sku_name

#   network {
#     app_subnet_id                               = var.app_subnet_id
#     service_runtime_subnet_id                   = var.service_runtime_subnet_id
#     cidr_ranges                                 = var.cidr_ranges
#     app_network_resource_group                  = var.app_network_resource_group #"${var.sc_service_name}-apps-rg"
#     service_runtime_network_resource_group      = var.service_runtime_network_resource_group #${var.sc_service_name}-runtime-rg"
#   }
  
  timeouts {
    create = var.timeout_create
    delete = var.timeout_delete
  }

  trace {
    instrumentation_key = var.instrumentation_key #azurerm_application_insights.sc_app_insights.instrumentation_key
  }
}