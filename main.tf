provider "azurerm" { 
    version = "1.36.0" 
} 

module "rg" {
    source = "./rg"

    rg_name = var.rg_name
    location = var.location
    tags = var.tags

} 

# module "state" {
#     source = "./state"

#     rg_name = var.rg_name_state
#     storage_account_name = var.storage_account_name
#     container_name = var.container_name
#     location = var.state_location
#     tags = var.state_tags

# }

module "vm" {
    source = "./vm"

    name = module.rg.obj_rg.name
    location = var.location
    tags = var.tags
    
    nameTFVN = var.nameTFVN
    nameTFS = var.nameTFS
    nameTFPIP = var.nameTFPIP
    nameTFNSG = var.nameTFNSG
    nameTFNI = var.nameTFNI
    nameIPConfig = var.nameIPConfig
    nameTFRT = var.nameTFRT
}

