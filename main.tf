# Configure the provider. 
# Replace your subscription_id and tenant_id with a .tfvars file
# that contains both the ids and possibly the other variables in this file.
provider "azurerm" {
    version         = "~>1.30.0"
    subscription_id = var.subscription_id
    tenant_id       = var.tenant_id
}

# Create resource group.
resource "azurerm_resource_group" "test" {
    name            = var.resourceName
    location        = var.region

    # Add tags.
    tags            = {
        environment = var.tagEnvironment
        project     = var.tagProject
    }
}

# Create virtual network. Mainly used to connect virtual machines to virtual machines.
# Here we are using it to connect our virtual machine to a subnet.
resource "azurerm_virtual_network" "test" {
    name                = var.nameTFVN
    resource_group_name = azurerm_resource_group.test.name
    location            = azurerm_resource_group.test.location
    address_space       = ["10.0.0.0/16"]
}

# Create subnet. Mainly handles dividing of IP addresses. 
resource "azurerm_subnet" "test" {
    name                 = var.nameTFS
    resource_group_name  = azurerm_resource_group.test.name
    virtual_network_name = azurerm_virtual_network.test.name
    address_prefix       = "10.0.2.0/24"
}

# Create public IP. This is the IP that the VM will be associated to.
resource "azurerm_public_ip" "test" {
    name                = var.nameTFPIP
    location            = azurerm_resource_group.test.location
    resource_group_name = azurerm_resource_group.test.name
    allocation_method   = "Static"
}

# Create security group. This component is responsible for deciding access to VM.
# In this case we are using SSH.
resource "azurerm_network_security_group" "test" {
    name                = var.nameTFNSG
    location            = azurerm_resource_group.test.location
    resource_group_name = azurerm_resource_group.test.name

    security_rule {
        name                       = "SSH"
        priority                   = 1001
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
    }
}

# Create network interface. Establish a connection to SSH using the given IP.
resource "azurerm_network_interface" "test" {
    name                = var.nameTFNI
    location            = azurerm_resource_group.test.location
    resource_group_name = azurerm_resource_group.test.name
    ip_configuration    {
        name                            = var.nameIPConfig
        subnet_id                       = azurerm_subnet.test.id
        private_ip_address_allocation   = "Dynamic"
        public_ip_address_id            = azurerm_public_ip.test.id
    }
}

# Start virtual machine. This resource is where the core of the virtual machine is.
resource "azurerm_virtual_machine" "vm_test" {
    name                    = var.nameTFVM
    location                = azurerm_resource_group.test.location
    resource_group_name     = azurerm_resource_group.test.name
    network_interface_ids   = [ azurerm_network_interface.test.id ]
    vm_size                 = var.VMSize

    # Delete resources when vm is terminated
    delete_os_disk_on_termination = true
    delete_data_disks_on_termination = true

    # Specify version of linux
    storage_image_reference {
        publisher = "Canonical"
        offer     = "UbuntuServer"
        sku       = "18.04-LTS"
        version   = "latest"
    }

    # Assemble the storage for the kernel.
    storage_os_disk {
        name              = var.OSDiskName
        caching           = "ReadWrite"
        create_option     = "FromImage"
        managed_disk_type = var.OSDiskSize
    }

    # Give login details of the VM.
    os_profile {
        computer_name  = var.hostName
        admin_username = var.adminUser
        admin_password = var.adminPassword
    }

    # Default request the password in order to access.
    os_profile_linux_config {
        disable_password_authentication = false
    }
}

