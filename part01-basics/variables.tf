# global variables
variable "location" {
  description = "resources default location"
  default     = "North Europe"
}

variable "resource_group_name" {
  description = "project resource group"
  default     = "azcrashcourses-neu-dev-rg"
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