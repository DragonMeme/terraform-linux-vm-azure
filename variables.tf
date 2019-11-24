variable "location" {
  description = "Where to deploy my resources"
  default     = "australiaeast"
}

variable "rg_name" {
  description = "Name of the resource group to deploy things such as virtual machine."
}

variable "tags" {
  description = "tags"
}

variable "storage_account_name" {
}

variable "container_name" {
}

variable "state_name" {
}

variable "rg_name_state" {
  
}

variable "project_name" {
}

variable "state_tags" {
  
}

variable "state_location" {
  
}

# name for virtual machine
variable "nameTFVM" {
    default = "myTFLVM"
}

# name for virtual network
variable "nameTFVN" {
    default = "myTFVN"
}

# name for subnet
variable "nameTFS" {
    default = "myTFS"
}

# name for public ip address
variable "nameTFPIP" {
    default = "myTFPIP"
}

# name for security network group
variable "nameTFNSG" {
    default = "myTFNSG"
}

# name for network interface
variable "nameTFNI" {
    default = "myTFNI"
}

# name for IP configuration
variable "nameIPConfig" {
    default = "myIPC"
}

# name for the route table
variable "nameTFRT" {
    default = "myTFRT"
    description = "Name of the route table to be created."
}

# name for host virtual machine
variable "hostName" {
    default = "hostname"
}

# name for administrator username
variable "adminUser" {
    default = "adminUser"
}

# password for administrator
variable "adminPassword" {
    default = "Password!234"
}

# specify size of VM
variable "VMSize" {
    default = "Standard_G1"
}

# name of disk for os
variable "OSDiskName" {
    default = "linux_os_disk"
}

#specify size to store os
variable "OSDiskSize" {
    default = "Standard_LRS"
}

