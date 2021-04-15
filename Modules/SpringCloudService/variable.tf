variable "azurerm_spring_cloud_service_name" {
  description = "Specifies the name of the Spring Cloud Service resource."
}

variable "resource_group_name" {
  description = "Specifies The name of the resource group in which to create the Spring Cloud Service."
}

variable "location" {
  description = "Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
}

variable "sku_name" {
  description = "Specifies the SKU Name for this Spring Cloud Service."
  default = "S0"
}

#Network

# variable "app_subnet_id" {
#     description = "Specifies the ID of the Subnet which should host the Spring Boot Applications deployed in this Spring Cloud Service."
# }
#
# variable "service_runtime_subnet_id" {
#     description = "Specifies the ID of the Subnet where the Service Runtime components of the Spring Cloud Service will exist."
# }

# variable "cidr_ranges" {
#     description = "A list of (at least 3) CIDR ranges (at least /16) which are used to host the Spring Cloud infrastructure, which must not overlap with any existing CIDR ranges in the Subnet."
# }

# variable "app_network_resource_group" {
#     description = "Specifies the Name of the resource group containing network resources of Azure Spring Cloud Apps."
# }

# variable "service_runtime_network_resource_group" {
#     description = "Specifies the Name of the resource group containing network resources of Azure Spring Cloud Service Runtime."
# }

#Timeout

variable "timeout_create" {
  description = "Used when creating the Spring Cloud Application."
  default = "60m"
} 
variable "timeout_delete" {
  description = "Used when deleting the Spring Cloud Application."
  default = "2h"
}

#Trace

variable "instrumentation_key" {
    description = "The Instrumentation Key used for Application Insights."
}