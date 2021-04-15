output "name" {
  description   = "Specifies the name of the Resource Group"
  value         = azurerm_resource_group.rg.name
}

output "location" {
  description   = "Specifies the name of the Resource Group"
  value         = azurerm_resource_group.rg.location
}

output "id" {
    description = "Specifies the id of the Resource Group"
    value       = azurerm_resource_group.rg.id
}