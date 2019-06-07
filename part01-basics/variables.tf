# global variables
variable "location" {
  description = "resources default location"
  default     = "North Europe"
}

variable "resource_pattern" {
  description = "project resource naming pattern"
  default     = "azcrashcourses-neu-dev"
}

# network variables
variable "vnet_address_space" {
  description = "vnet address space"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "subnet_address_prefix" {
  description = "subnet address prefix"
  default     = "10.0.1.0/24"
}

# virtual machine variables
variable "vm_size" {
  description = "virtual machine size"
  default     = "Standard_B1s"
}

variable "vm_admin_user" {
  description = "virtual machine user"
  default     = "deployer"
}

# tags variables
variable "name" {
  description = "default resource name in tag block"
  default     = "azcrashcourses"
}

variable "environment" {
  description = "default environment"
  default     = "dev"
}

variable "resource_owner" {
  description = "default resource owner"
  default     = "vla"
}

variable "project" {
  description = "default project name"
  default     =  "azcrashcourses"
}