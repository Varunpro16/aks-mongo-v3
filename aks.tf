# AKS Cluster
resource "azurerm_kubernetes_cluster" "aks" {
  name                = "aks-cluster-${random_integer.ri.result}"
  location            = var.cluster_location
  resource_group_name = data.azurerm_resource_group.rg.name
  dns_prefix          = "aks-${random_integer.ri.result}"

  default_node_pool {
    name       = "default"
    node_count = var.node_count
    vm_size    = var.vm_size
    vnet_subnet_id = azurerm_subnet.aks_subnet.id
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin = "azure"
    dns_service_ip = "10.0.3.10"  # Make sure this is in the aks_subnet range
    service_cidr   = "10.0.3.0/24"  # Ensure this does not overlap with existing subnets
  }

  depends_on = [azurerm_virtual_network.vnet]  # Ensure the vnet is created first
}