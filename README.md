# AzureDemo

Demo infrastructure repo for Azure. It shows how Terraform is structured with a bootstrap layer and a main stack, plus a simple CI/CD workflow for `fmt/init/validate/plan` and a Trivy scan (apply is manual).

## Structure
- `Dev/bootstrap` - creates a resource group, a storage account, and a Blob container for Terraform state.
- `Dev` - main infrastructure (ACR) that uses the state backend.
- `.github/workflows/demo.yml` - example CI/CD pipeline.

## Flow
1) Bootstrap creates the storage account + container for state.  
2) Main stack creates the ACR.  
3) CI runs `fmt/init/validate/plan` and a Trivy scan; `apply` is triggered manually.
