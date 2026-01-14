# AzureInfra

Terraform repo for Azure with a bootstrap stack for state storage and the main infrastructure in `Dev`.

## Structure
- `Dev/bootstrap` - creates the resource group, storage account, and `tfstate` container for the backend.
- `Dev` - main infrastructure, uses the Blob Storage backend.

## Requirements
- `terraform`
- `az` (Azure CLI)
- Access to an Azure subscription

## 1) Bootstrap (first)
Bootstrap must be applied first, because the backend has to exist before Terraform in `Dev` can initialize.

Steps:
```bash
cd Dev/bootstrap
terraform init
terraform apply
```

After this you should have:
- Resource group
- Storage account
- `tfstate` container

## 2) Main infrastructure (second)
In `Dev`, add the `azurerm` backend (e.g. `Dev/backend.tf`):
```hcl
terraform {
  backend "azurerm" {
    resource_group_name  = "fcb_alz_resource-group"
    storage_account_name = "stgr101"
    container_name       = "tfstate"
    key                  = "dev.terraform.tfstate"
  }
}
```

Note: you cannot use `var.*` inside the `backend` block. If you want to parameterize it, use:
```bash
terraform init -backend-config=...
```

Then:
```bash
cd Dev
terraform init -migrate-state
terraform plan
```

After migration, the state file should be visible in the `tfstate` container in Azure Portal.
# AzureDemo
# AzureDemo
