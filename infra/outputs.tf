output "public_ip_address" {
  description = "The public IP address of the VM"
  value       = azurerm_public_ip.public_ip.ip_address
}

output "nsg_name" {
  value       = azurerm_network_security_group.nsg.name
}

output "resource_group_name" {
  value       = azurerm_resource_group.rg.name
}
