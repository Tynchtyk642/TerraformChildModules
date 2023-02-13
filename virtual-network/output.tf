output "vnet" {
  value = azurerm_virtual_network.vnet

  depends_on = [
    azurerm_network_security_group.aks_nsg,
    azurerm_subnet_network_security_group_association.aksnsgsnet,
    azurerm_application_security_group.aks_asg,
    azurerm_network_security_group.aksilb_nsg,
    azurerm_subnet_network_security_group_association,
  ]
}

output "vnet_id" {
  value = azurerm_virtual_network.vnet.id
}

output "public_subnet" {
  value = azurerm_subnet.public_snet

  depends_on = [
    azurerm_network_security_group.aks_nsg,
    azurerm_subnet_network_security_group_association.aksnsgsnet,
    azurerm_application_security_group.aks_asg,
    azurerm_network_security_group.aksilb_nsg,
    azurerm_subnet_network_security_group_association,
  ]
}

output "public_subnet_id" {
  value = azurerm_subnet.public_snet.id
}

output "private_subnet" {
  value = azurerm_subnet.privat_snet

  depends_on = [
    azurerm_network_security_group.aks_nsg,
    azurerm_subnet_network_security_group_association.aksnsgsnet,
    azurerm_application_security_group.aks_asg,
    azurerm_network_security_group.aksilb_nsg,
    azurerm_subnet_network_security_group_association,
  ]
}

output "private_subnet_id" {
  value = azurerm_subnet.privat_snet.id
}

output "aks_subnet" {
  value = azurerm_subnet.aks_snet

  depends_on = [
    azurerm_network_security_group.aks_nsg,
    azurerm_subnet_network_security_group_association.aksnsgsnet,
    azurerm_application_security_group.aks_asg,
    azurerm_network_security_group.aksilb_nsg,
    azurerm_subnet_network_security_group_association,
  ]
}

output "aks_subnet_id" {
  value = azurerm_subnet.aks_snet.id
}

output "akslib_subnet" {
  value = azurerm_subnet.aksilb_snet

  depends_on = [
    azurerm_network_security_group.aks_nsg,
    azurerm_subnet_network_security_group_association.aksnsgsnet,
    azurerm_application_security_group.aks_asg,
    azurerm_network_security_group.aksilb_nsg,
    azurerm_subnet_network_security_group_association,
  ]
}

output "akslib_subnet_id" {
  value = azurerm_subnet.aksilb_snet.id
}

output "aks_nsg_id" {
  value = azurerm_network_security_group.aks_nsg.id
}

output "aksnsgsnet_id" {
  value = azurerm_subnet_network_security_group_association.aksnsgsnet.id
}

output "aks_asg_id" {
  value = azurerm_application_security_group.aks_asg.id
}

output "aksilb_nsg_id" {
  value = azurerm_network_security_group.aksilb_nsg.id
}

output "aksilbnsgsnet_id" {
  value = azurerm_subnet_network_security_group_association.aksilbnsgsnet.id
}
