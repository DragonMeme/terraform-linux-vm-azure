# Set the state to be stored in a blob hosted in Azure.
terraform {
  backend "azurerm" {
    storage_account_name = "msa2019interntfstatetest"
    container_name       = "tfstate"
    key                  = "prod.terraform.tfstate"
    resource_group_name  = "RG_TEST"
  }
}