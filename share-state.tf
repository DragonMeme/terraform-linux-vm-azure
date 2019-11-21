# Set the state to be stored in a blob hosted in Azure.
# This assumes that there is a resource group name called RG_TEST that consists 
# of a container named "tfstate" inside a storage account named "msa2019intertfstatetest".

terraform {
  backend "azurerm" {
    storage_account_name = "msa2019interntfstatetest"
    container_name       = "tfstate"
    key                  = "test.terraform.tfstate"
    resource_group_name  = "RG_TEST"
  }
}