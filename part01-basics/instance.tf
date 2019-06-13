# Azure virtual machine network interface
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

  tags = {
    name = "${var.name}-nic"
    environment = "${var.environment}"
    owner = "${var.resource_owner}"
    project = "${var.project}"
  }
}

# Azure virtual machine
resource "azurerm_virtual_machine" "vm" {
  name                  = "${var.resource_pattern}-vm"
  location              = "${data.azurerm_resource_group.dev.location}"
  resource_group_name   = "${data.azurerm_resource_group.dev.name}"
  network_interface_ids = ["${azurerm_network_interface.nic.id}"]
  vm_size               = "${var.vm_size}"

  # Uncomment this line to delete the OS disk automatically when deleting the VM
  delete_os_disk_on_termination = true

  # Uncomment this line to delete the data disks automatically when deleting the VM
  delete_data_disks_on_termination = true

  storage_image_reference {
    id  = "${data.azurerm_subscription.current.id}/resourceGroups/${data.azurerm_resource_group.dev.name}/providers/Microsoft.Compute/images/centos7v3-openjdk11"
  }

  storage_os_disk {
    name              = "${var.resource_pattern}-vm-osdisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = "${var.resource_pattern}-profilejvm"
    admin_username = "${var.vm_admin_user}"
  }

  os_profile_linux_config {
    disable_password_authentication = true
    ssh_keys {
      key_data = file("~/.ssh/provisioner.pub")
      path = "/home/${var.vm_admin_user}/.ssh/authorized_keys"
    }
  }

  tags = {
    name = "${var.name}-vm"
    environment = "${var.environment}"
    owner = "${var.resource_owner}"
    project = "${var.project}"
  }
}