terraform {
  required_version = ">=0.13"

  backend "azurerm" {
    resource_group_name  = "rg-rbd-terraform-deploy"
    storage_account_name = "strbdterraformdeploy"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
  skip_provider_registration = "true"
  features {}
}

resource "random_string" "random" {
  length  = 4
  special = false
  lower   = false
  upper   = false
  number  = true
}

module "resourcegroup-0000" {
  source                      = "../../Modules/ResourceGroup"
  azurerm_resource_group_name = "rg-${var.solution_name}-${var.environment}-${var.location}-${random_string.random.result}"
  location                    = var.location
}

module "applicationinsights-0000" {
  source                            = "../../Modules/ApplicationInsights"
  azurerm_application_insights_name = "apim-${var.solution_name}-${var.environment}-${var.location}-${random_string.random.result}"
  location                          = module.resourcegroup-0000.location
  resource_group_name               = module.resourcegroup-0000.name
  application_type                  = "web"
}

module "springcloudservice-0000" {
  source                            = "../../Modules/SpringCloudService"
  azurerm_spring_cloud_service_name = "scs-${var.solution_name}-${var.environment}-${var.location}-${random_string.random.result}"
  resource_group_name               = module.resourcegroup-0000.name
  location                          = module.resourcegroup-0000.location
  instrumentation_key               = module.applicationinsights-0000.instrumentation_key
}

module "springcloudapp-0000" {
  source                        = "../../Modules/SpringCloudApp"
  azurerm_spring_cloud_app_name = "scapp-app1-${var.environment}-${random_string.random.result}"
  resource_group_name           = module.resourcegroup-0000.name
  service_name                  = module.springcloudservice-0000.name
}

module "springcloudapp-0001" {
  source                        = "../../Modules/SpringCloudApp"
  azurerm_spring_cloud_app_name = "scapp-app2-${var.environment}-${random_string.random.result}"
  resource_group_name           = module.resourcegroup-0000.name
  service_name                  = module.springcloudservice-0000.name
}