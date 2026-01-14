terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.57.0"
    }
  }
  backend "azurerm" {
      resource_group_name  = "fcb_alz_resource-group"
      storage_account_name = "stgr101"
      container_name       = "tfstate"
      key                  = "terraform.tfstate"
}
}

provider "azurerm" {
    features {
      
    }
      subscription_id = var.subid

  # Configuration options
}