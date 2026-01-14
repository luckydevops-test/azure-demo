variable "resource_group_name" {
  type        = string
  description = "Resource group name for the ACR."
}

variable "location" {
  type        = string
  description = "Azure region for the ACR."
}

variable "acr_name" {
  type        = string
  description = "Globally unique ACR name (lowercase alphanumeric, 5-50 chars)."

  validation {
    condition     = can(regex("^[a-z0-9]{5,50}$", var.acr_name))
    error_message = "acr_name must be 5-50 lowercase alphanumeric characters."
  }
}

variable "sku" {
  type        = string
  description = "ACR SKU (Basic, Standard, Premium)."
  default     = "Premium"

  validation {
    condition     = contains(["Basic", "Standard", "Premium"], var.sku)
    error_message = "sku must be one of: Basic, Standard, Premium."
  }
}

variable "admin_enabled" {
  type        = bool
  description = "Enable admin user for the ACR."
  default     = false
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to the ACR."
  default     = {}
}
