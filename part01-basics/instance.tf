# virtual machine network interface
resource "azurerm_network_interface" "nic" {
  name                = "${var.resource_pattern}-nic"
  location            = "${data.azurerm_resource_group.dev.location}"
  resource_group_name = "${data.azurerm_resource_group.dev.name}"

  ip_configuration {
    name                          = "${var.resource_pattern}-ipconfig"
    subnet_id                     = "${data.azurerm_subnet.subnet.id}"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = "${data.azurerm_public_ip.public_ip.id}"
  }
}