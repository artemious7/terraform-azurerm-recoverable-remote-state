variable "resource_group_name" {
  description = "Existing resource group name to create the resources in."
  type        = string
}

variable "application_tag" {
  description = "Name of the application or project to use as a tag for the resources."
  type        = string
  default     = null
}

# TODO: max length
variable "name_suffix" {
  description = "Suffix to use in the storage account name and the blob container name. Has to be shorter than 23 characters."
  type        = string
  default     = "terraformstate"
}

variable "retention" {
  description = "Retention in days."
  type = number
  default = 7
}

variable "blob_name" {
  description = "Blob name of the Terraform state file. The convention is to use the .tfstate extension. This variable is only used in the output to provide a default value."
  type = string
  default = ".tfstate"
}

variable "create_resource_lock" {
  description = "Create resource lock for the storage account?"
  type = bool
  default = true
}