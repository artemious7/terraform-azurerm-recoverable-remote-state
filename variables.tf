variable "resource_group_name" {
  description = "Existing resource group name to create the resources in."
  type        = string
  nullable    = false
}

variable "application_tag" {
  description = "Name of the application or project to use as a tag for the resources."
  type        = string
  default     = null
}

variable "name_suffix" {
  description = "Suffix to use in the storage account name and the blob container name. Has to be shorter than 23 characters."
  type        = string
  default     = "terraformstate"

  validation {
    condition     = length(var.name_suffix) < 24
    error_message = "This variable must be <= 24 characters since it's the limit for storage account name."
  }
}

variable "retention" {
  description = "Retention in days."
  type        = number
  default     = 7
  nullable    = false
}

variable "blob_name" {
  description = "Blob name of the Terraform state file. The convention is to use the .tfstate extension. This variable is only used in the output to provide a default value."
  type        = string
  default     = ".tfstate"
  nullable    = false
}

variable "create_resource_lock" {
  description = "Create resource lock for the storage account?"
  type        = bool
  default     = true
  nullable    = false
}