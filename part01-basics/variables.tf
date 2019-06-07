# global variables
variable "location" {
  description = "resources default location"
  default     = "North Europe"
}

variable "resource_pattern" {
  description = "project resource naming pattern"
  default     = "azcrashcourses-neu-dev"
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