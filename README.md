# terraform-linux-vm-azure

Adapted from [Getting Started](https://learn.hashicorp.com/terraform?track=azure#azure)

Linux VM implementation in Terraform to Azure.

## Requirements: 
* Microsoft Azure account with subscription_id and tenant_id.
* A `.tfvars` file (see example below and not included with the repo so you have to make your own) with at least:
  * subscription_id
  * tenant_id
* Terraform ([Download here](https://www.terraform.io/downloads.html) based on operating system.)
* git (so you can clone this repository)
  
Example: 

`example.tfvars` file contents (replace with your own valid ids):
```tfvars
  subscription_id = XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX
  tenant_id = OOOOOOOO-OOOO-OOOO-OOOO-OOOOOOOOOOOO
```

## How to run: 

Clone this repository using the command:
```
git clone https://github.com/DragonMeme/terraform-linux-vm-azure.git
```

### Windows 10:
Preparation: You will have to have terraform setup as an environment variable before following this step.
Otherwise the easy way is to move the `terraform.exe` file to the same directory as your project.

1.) Enter command `terraform init` (`./terraform init` if doing the easy way) in your terminal.

OPTIONAL: `terraform plan` or `./terraform plan` to double check setup.

2.) Then enter command `terraform apply -var-file='example.tfvars'` (`./terraform apply -var-file='example.tfvars'` if doing the easy way). You will have to wait for around 3 minutes for the process to be done. When done there should be an output of the command. The output should be of the form `ssh adminUser@20.192.192.192`.

3.) Copy and paste the command to the terminal. 

4.) Follow terminal instructions and enter your password. (Use `terraform output Password` or `./terraform output Password` if you have forgotten the password.)

5.) Congratulations, you have access to your linux virtual machine. To return to terminal from SSH press `Ctrl` + `D`.

6.) IMPORTANT: `terraform destroy'` or `./terraform destroy` after use and do not close terminal while destroying is on progress.

### Ubuntu 18.04: 
Preparation: You will have to extract from the downloaded `.tar.gz` file first and then move the `terraform` file to `/usr/local/bin/`. Command to do this is:
```bash
sudo mv terraform /usr/local/bin/
```

1.) Enter command `terraform init` in your terminal.

OPTIONAL: `terraform plan` to double check setup.

2.) Then enter command `terraform apply -var-file=example.tfvars`. You will have to wait for around 3 minutes for the process to be done. When done there should be an output of the command. The output should be of the form `ssh adminUser@20.192.192.192`.

3.) Copy and paste the command to the terminal. 

4.) Follow terminal instructions and enter your password. (Use `terraform output Password` if you have forgotten the password.)

5.) Congratulations, you have access to your linux virtual machine. To return to terminal from SSH press `Ctrl` + `D`.

6.) IMPORTANT: `terraform destroy -var-file='example.tfvars'` after use and do not close terminal while destroying is on progress.