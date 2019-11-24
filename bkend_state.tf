terraform {
  backend "azurerm" {
    storage_account_name = "msa2019interntfstate"
    container_name       = "tfstate"
    key                  = "test.terraform.tfstate"
  }
}