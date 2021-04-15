variable "azurerm_application_insights_name" {
  description = "Specifies the name of the Application Insights component."
}

variable "location" {
  description = "Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the Application Insights component."
}

variable "application_type" {
  description = "pecifies the type of Application Insights to create. Valid values are ios for iOS, java for Java web, MobileCenter for App Center, Node.JS for Node.js, other for General, phone for Windows Phone, store for Windows Store and web for ASP.NET"
  default     = "web"
}