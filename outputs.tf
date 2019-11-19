# Prints the ssh command to be used for connecting to the virtual machine.
output "Command" {
    value = "ssh ${var.adminUser}\u0040${azurerm_public_ip.test.ip_address}"
    description = "Command used to access the user virtual machine."
}

output "Password" {
    value = var.adminPassword
    description = "Password to access admin user of linux virtual machine."
    sensitive = true
}