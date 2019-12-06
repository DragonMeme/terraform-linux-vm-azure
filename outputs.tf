# Prints the ssh command to be used for connecting to the virtual machine.
output "Command" {
    value = "ssh ${var.adminUser}\u0040${var.nameDNS}.${var.region}.cloudapp.azure.com"
    description = "Command used to access the user virtual machine."
}

# Optional password output. Use 'terraform output Password' to display the password.
output "Password" {
    value = var.adminPassword
    description = "Password to access admin user of linux virtual machine."
    sensitive = true
}