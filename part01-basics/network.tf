# Azure network configuration
data "azurerm_resource_group" "dev" {
  name = "${var.resource_pattern}-rg"
}

resource "azurerm_network_security_group" "network_security_group" {
  name                = "${var.resource_pattern}-nsg"
  location            = "${data.azurerm_resource_group.dev.location}"
  resource_group_name = "${data.azurerm_resource_group.dev.name}"

  tags = {
    name = "${var.name}-nsg"
    environment = "${var.environment}"
    owner = "${var.resource_owner}"
    project = "${var.project}"
  }
}

resource "azurerm_network_security_rule" "network_security_rule_http" {
  name                        = "${var.resource_pattern}-nsr-http-inbound"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "8090"
  destination_port_range      = "80"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = "${data.azurerm_resource_group.dev.name}"
  network_security_group_name = "${var.resource_pattern}-nsg"
}