variable "subscription_id" {
    # replace "invalid" with your subscription id
    default = "invalid"
    description = "Add your valid subscription to this variable."
}

variable "tenant_id" {
    # replace "invalid" with your tenant id
    default = "invalid"
    description = "Add your valid subscription to this variable."
}

variable "region" {
    default = "australiaeast"
}

variable "resourceName" {
    default = "testLinuxVMDeploy"
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

# tag environment
variable "tagEnvironment" {
    default = "Virtual Machine"
    description = "Add tag to what the purpose of what the scripts here does overall."
}

variable "tagProject" {
    default = "Linux Launcher"
    description = "Add tag to what the purpose of what the scripts here does overall."
}

variable "tagAuthor" {
    default = "Anonymous"
    description = "Add name of author."
}