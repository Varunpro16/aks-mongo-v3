
# Cosmos DB Account (MongoDB API)
resource "azurerm_cosmosdb_account" "cosmosdb" {
  name                = "cosmosdb-${random_integer.ri.result}"
  location            = var.cosmodb_location
  resource_group_name = data.azurerm_resource_group.rg.name
  offer_type          = "Standard"
  kind                = "MongoDB"

  consistency_policy {
    consistency_level = "Session"
  }

  capabilities {
    name = "EnableMongo"
  }

  geo_location {
    location          = var.cosmodb_location
    failover_priority = 0
  }
}

