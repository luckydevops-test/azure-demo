variable "subid" {
  type        = string
  description = "Azure subscription ID."
}

variable "location" {
  type        = string
  description = "Azure region for bootstrap resources."
}

variable "resource_group_name" {
  type        = string
  description = "Resource group name for the bootstrap resources."
}

variable "storage_account_name" {
  type        = string
  description = "Storage account name for Terraform state."

  validation {
    condition     = can(regex("^[a-z0-9]{3,24}$", var.storage_account_name))
    error_message = "storage_account_name must be 3-24 lowercase alphanumeric characters."
  }
}

variable "storage_account_tier" {
  type        = string
  description = "Storage account tier (Standard, Premium)."
  default     = "Standard"

  validation {
    condition     = contains(["Standard", "Premium"], var.storage_account_tier)
    error_message = "storage_account_tier must be one of: Standard, Premium."
  }
}

variable "storage_account_replication_type" {
  type        = string
  description = "Storage account replication type."
  default     = "LRS"
}

variable "storage_container_name" {
  type        = string
  description = "Storage container name for Terraform state."
  default     = "tfstate"
}

variable "storage_container_access_type" {
  type        = string
  description = "Storage container access type."
  default     = "private"
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to bootstrap resources."
  default     = {}
}
