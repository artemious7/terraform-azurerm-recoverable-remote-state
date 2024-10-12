variable "subscription_id" {
  description = "Azure subscription id."
  type        = string
}

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
