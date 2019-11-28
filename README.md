# terraform-linux-vm-azure (remote state build)

Click [here](https://github.com/DragonMeme/terraform-linux-vm-azure/tree/local-state) for local state instructions.

Adapted from [Getting Started](https://learn.hashicorp.com/terraform/azure/intro_az)

Ubuntu 18.04 LTS Virtual Machine implementation to Azure in Terraform.

## Contents:
In order to run a virtual machine, these components are needed:
* Virtual network: Network that connects VM to VM(s) or other components.
* Subnet: Handles IP address(es) processes.
* Public IP Address: The address needed to connect to VM.
* Network Security Group: Decides how the VM should be accessed, in this case we use SSH to access the VM.
* Network Interface: Helps connect the host to the private/public network.

But in this case, route table is optional as not a lot of people would be accessing the VM.

The components above are already set in `main.tf` along with the implementation of the virtual machine.

`outputs.tf` contains the output of the command needed to access the virtual machine along with the password to log in to the virtual machine in case the password is forgotten.

`variables.tf` contains default values for most inputs if not assigned any value in a `.auto.tfvars` file.

## Requirements: 
* Microsoft Azure account with subscription_id and tenant_id.
* A `.auto.tfvars` file (see example below and is not included with the repo so you have to make your own) with at least:
  * subscription_id
  * tenant_id
* Terraform ([Download here](https://www.terraform.io/downloads.html) based on operating system.)
* git (so you can clone this repository)
  
Example: 

`example.auto.tfvars` file contents (replace with your own valid ids):
```tfvars
  subscription_id = "XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX"
  tenant_id = "OOOOOOOO-OOOO-OOOO-OOOO-OOOOOOOOOOOO"

  # Optional
  tags = {
    createdBy = "Jason"
    environment = "VM"
    project = "Linux"
  }
  hostName = "myVM"
  # If adding username, username can only contain letters.
  adminUser = "ubuntu"
  # If changing username, must add password that contains uppercase and lowercase letters and numbers and 6-72 characters long.
  adminPassword = "Port4b1e"
```

WARNING: This service can cost money so remember to delete resource group using the terraform destroy command.

## How to run: 

Clone this repository using the command:
```
git clone -b remote-state https://github.com/DragonMeme/terraform-linux-vm-azure.git
```

Login to azure using `az login`.

You will have a list consisting of your subscription ID (key is `id`) and tenant ID (key is `tenantId`), put those in the `.auto.tfvars` file.

This branch is designed to input tfstates into the cloud storage and so will involve an extra repository.

Clone the given repository [(Click here)](https://github.com/DragonMeme/terraform-storage-system-azure.git) and follow the instructions there.

THe output command of that project after `terraform apply` should be of the form: 
```bash
export ARM_ACCESS_KEY=$(az storage account keys list --resource-group RG --account-name tfstatetest --query [0].value -o tsv)
```

Run the given output command in a bash terminal (git bash works on both windows and linux).

### Windows 10:
Preparation: You will have to have terraform setup as an environment variable before following this step.
Otherwise the easy way is to move the `terraform.exe` file to the same directory as your project.

Note: If doing the easy way, your command prefix will be `./terraform` instead of `terraform`.

1.) Enter command `terraform init` in your terminal.

OPTIONAL: `terraform plan` to double check setup.

2.) Then enter command `terraform apply` if doing the easy way). You will have to wait for around 3 minutes for the process to be done. When done there should be an output of the command. The output should be of the form `ssh adminUser@20.192.192.192`.

OPTIONAL: Use `terraform output Password` if you have forgotten the password or want it printed on console.

3.) Copy and paste the command to the terminal. 

4.) Follow terminal instructions and enter your password. Default password is `Password!234`

5.) Congratulations, you have access to your linux virtual machine. To return to terminal from SSH press `Ctrl` + `D` or type in command `logout`.

6.) You now only have access to the linux terminal for now, to have a desktop, you will have to install remote desktop software support.

7.) Type the following commands on to the linux terminal in order to be able to have a linux desktop: 


  a.) Type in the following commands:
  ```bash
  # Copy and paste each command line by line
  sudo apt-get update
  sudo apt-get upgrade

  # Installs support for RDP so that desktop can be used.
  sudo apt-get -y install xrdp
  ```

  b.) You have a choice of a few desktop setups. Do this if you want lubuntu setup, otherwise skip this step. Type in the following commands:
  ```bash
  # Obtain the necessary packages for lubuntu
  sudo apt-get install lubuntu-desktop

  # Tell xrdp to use lubuntu session
  sudo echo "lxsession -s Lubuntu -e LXDE" > ~/.xsession
  ```
  c.) Do this if you want xubuntu setup, otherwise skip this step. Type in the following commands:
  ```bash
  # Obtain the necessary packages for xubuntu
  sudo apt-get install xfce4 -y 

  # Use command as root
  sudo su

  # Tell xrdp to use xubuntu package
  echo xfce4-session >/root/.xsession 

  # Allow other users to use the virtual machine instead of only console.
  sed -i '/\/etc\/X11\/Xsession/i xfce4-session' /etc/xrdp/startwm.sh
  ```

  d.) Restart xrdp by typing in the command line `sudo /etc/init.d/xrdp restart`

8.) Run `Remote Desktop Connections` and type the IP address (from the output command, should be of the form `20.214.2.214` after the `@` on the ssh command.) and then press connect.
OPTIONAL: Input username and password on the remote desktop connection so you do not need to login.

9.) Now you have a desktop interface to operate with.

6.) IMPORTANT: `terraform destroy` after use and do not close terminal while destroying is on progress.

### Ubuntu 18.04: 
Preparation: You will have to extract from the downloaded `.tar.gz` file first and then move the `terraform` file to `/usr/local/bin/`. Command to do this is:
```bash
sudo mv terraform /usr/local/bin/
```

1.) Enter command `terraform init` in your terminal.

OPTIONAL: `terraform plan` to double check setup.

2.) Then enter command `terraform apply`. You will have to wait for around 3 minutes for the process to be done. When done there should be an output of the command. The output should be of the form `ssh adminUser@20.192.192.192`.

OPTIONAL: Use `terraform output Password` if you have forgotten the password or want it printed on console.

3.) Copy and paste the command to the terminal. 

4.) Follow terminal instructions and enter your password. Default password is `Password!234`

5.) Congratulations, you have access to your linux virtual machine. To return to terminal from SSH press `Ctrl` + `D` or type in command `logout`.

6.) IMPORTANT: `terraform destroy` after use and do not close terminal while destroying is on progress.
