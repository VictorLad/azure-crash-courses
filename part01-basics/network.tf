# Azure network configuration
data "azurerm_resource_group" "dev" {
  name = "${var.resource_pattern}-rg"
}

# Azure network security group
resource "azurerm_network_security_group" "nsg" {
  name                = "${var.resource_pattern}-nsg"
  location            = "${data.azurerm_resource_group.dev.location}"
  resource_group_name = "${data.azurerm_resource_group.dev.name}"

  security_rule {
    name                        = "${var.resource_pattern}-nsr-http-inbound"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "8090"
    destination_port_range      = "80"
    source_address_prefix       = "*"
    destination_address_prefix  = "*"
  }

  tags = {
    name = "${var.name}-nsg"
    environment = "${var.environment}"
    owner = "${var.resource_owner}"
    project = "${var.project}"
  }
}

# Azure virtual network
resource "azurerm_virtual_network" "vnet" {
  name                        = "${var.resource_pattern}-vnet"
  location                    = "${data.azurerm_resource_group.dev.location}"
  resource_group_name         = "${data.azurerm_resource_group.dev.name}"
  address_space               = "${var.vnet_address_space}"

  subnet {
    name            = "${var.resource_pattern}-subnet"
    address_prefix  = "${var.subnet_address_prefix}"
    security_group  = "${azurerm_network_security_group.nsg.id}"
  }

  tags = {
    name = "${var.name}-vnet"
    environment = "${var.environment}"
    owner = "${var.resource_owner}"
    project = "${var.project}"
  }
}