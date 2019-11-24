# Prints the ssh command to be used for connecting to the virtual machine.
output "Command" {
    value = module.vm.Command
    description = "Command used to access the user virtual machine."
}

# Optional password output. Use 'terraform output Password' to display the password.
output "Password" {
    value = module.vm.Password
    description = "Password to access admin user of linux virtual machine."
    sensitive = true
}