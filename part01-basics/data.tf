# get resource group information
data "azurerm_resource_group" "dev" {
  name = "${var.resource_pattern}-rg"
}

# get subnet information
data "azurerm_subnet" "subnet" {
  name                  = "${var.resource_pattern}-subnet"
  virtual_network_name  = "${var.resource_pattern}-vnet"
  resource_group_name   = "${data.azurerm_resource_group.dev.name}"
}

# get public ip configuration
data "azurerm_public_ip" "public_ip" {
  name                  = "${azurerm_public_ip.public_ip.name}"
  resource_group_name   = "${data.azurerm_resource_group.dev.name}"
}

