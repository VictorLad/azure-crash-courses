# Create Azure resource group
resource "azurerm_resource_group" "resource_group" {
  location = "${var.location}"
  name = "${var.resource_group_name}"

  tags = {
    name = "${var.name}-rg"
    environment = "${var.environment}"
    owner = "${var.resource_owner}"
    project = "${var.project}"
  }
}