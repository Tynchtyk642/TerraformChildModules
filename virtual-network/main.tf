/*******************************************************
modul name: Virtual network
purpose: For Terraform final project
createt by: Kubat Usubaliev
*******************************************************/

resource "azurerm_resource_group" "rg" {
  name     = "${var.prefix_name}-resources"
  location = var.location
}

######################## Locals ########################
locals {
  rg_name = format("%s-%s-rg", var.prefix_name, var.unique)
  vnet_name = format("%s-%s-vnet", var.prefix_name, var.unique)
  subnet_name = format("%s-%s-subnet", var.prefix_name, var.unique)
  nsg_name = format("%s-%s-nsg", var.prefix_name, var.unique)
}

#################### Virtual Network ###################
# vnet
resource "azurerm_virtual_network" "vnet" {
  name                = local.vnet_name
  location            = var.location
  resource_group_name = var.rg_name
  address_space       = var.vnet_address_space

  tags                = var.tags_list
}

# public
resource "azurerm_subnet" "public_snet" {
    name                  = local.subnet_name
    resource_group_name   = var.rg_name
    virtual_network_name  = azurerm_virtual_network.vnet.name
    address_prefixes      = [element(var.vnet_address_space, 0)]   
}

# privare
resource "azurerm_subnet" "privat_snet" {
    name                  = local.subnet_name
    resource_group_name   = var.rg_name
    virtual_network_name  = azurerm_virtual_network.vnet.name
    address_prefixes      = [element(var.vnet_address_space, 1)]   
}

# aks
resource "azurerm_subnet" "aks_snet" {
    name                  = local.subnet_name
    resource_group_name   = var.rg_name
    virtual_network_name  = azurerm_virtual_network.vnet.name
    address_prefixes      = [element(var.vnet_address_space, 2)]   
}

# aksilb
resource "azurerm_subnet" "aksilb_snet" {
    name                  = local.subnet_name
    resource_group_name   = var.rg_name
    virtual_network_name  = azurerm_virtual_network.vnet.name
    address_prefixes      = [element(var.vnet_address_space, 3)]
}

################## NSG Configurations #################
# Configure AKS Rules
resource "azurerm_network_security_group" "aks_nsg" {
  name                = local.nsg_name
  location            = azurerm_virtual_network.vnet.location
  resource_group_name = azurerm_virtual_network.vnet.resource_group_name
  tags                = var.tags_list
}
resource "azurerm_subnet_network_security_group_association" "aksnsgsnet" {
  subnet_id                 = azurerm_subnet.aks_snet.id
  network_security_group_id = azurerm_network_security_group.aks_nsg.id
}
resource "azurerm_application_security_group" "aks_asg" {
  name                = local.nsg_name
  location            = azurerm_virtual_network.vnet.location
  resource_group_name = azurerm_virtual_network.vnet.resource_group_name
  tags                = var.tags_list
}

# Configure AKSILB Rules
resource "azurerm_network_security_group" "aksilb_nsg" {
  name                = local.nsg_name
  location            = azurerm_virtual_network.vnet.location
  resource_group_name = azurerm_virtual_network.vnet.resource_group_name
  tags                = var.tags_list
}
resource "azurerm_subnet_network_security_group_association" "aksilbnsgsnet" {
  subnet_id                 = azurerm_subnet.aksilb_snet.id
  network_security_group_id = azurerm_network_security_group.aksilb_nsg.id
}