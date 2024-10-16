# Private Endpoint for Cosmos DB
resource "azurerm_private_endpoint" "private_endpoint" {
  name                = "cosmosdb-private-endpoint"
  location            = "West US"
  resource_group_name = data.azurerm_resource_group.rg.name
  subnet_id           = azurerm_subnet.private_endpoint_subnet.id

  private_service_connection {
    name                           = "cosmosdb-psc"
    private_connection_resource_id = azurerm_cosmosdb_account.cosmosdb.id
    subresource_names              = ["mongodb"]
    is_manual_connection           = false
  }

  depends_on = [
    azurerm_virtual_network.vnet, 
    azurerm_cosmosdb_account.cosmosdb,
    azurerm_subnet.private_endpoint_subnet  # Ensure subnet is created first
  ]
}
