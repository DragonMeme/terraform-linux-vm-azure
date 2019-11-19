# terraform-linux-vm

Adapted from [Getting Started](https://learn.hashicorp.com/terraform?track=azure#azure)

Linux VM implementation in Terraform.

## Requirements: 
* Microsoft Azure account with subscription.
* A `.tfvars` file (see example below) with at least:
  * subscription_id
  * tenant_id
* Terraform ([Download here](https://www.terraform.io/downloads.html))
  
Example: 

`example.tfvars` file contents:
```tfvars
  subscription_id = XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX
  tenant_id = OOOOOOOO-OOOO-OOOO-OOOO-OOOOOOOOOOOO
```

Warning: This service can charge you so remember to `terraform destroy` or delete the resource group after use.

## How to run: 
Preparation: You will have to have terraform setup as an environment variable before following this step.
Otherwise the easy way is to move the `terraform.exe` file to the same directory as your project.

1.) Enter command `terraform init` (`./terraform init` if doing the easy way)

2.) Then enter command `terraform apply -var-file='example.tfvars'` (`./terraform apply -var-file='example.tfvars'` if doing the easy way). You will have to wait for around 3 minutes for the process to be done.

3.) Login to your Azure Home, you should see a resource group named `testProduction`, click on it.

4.) Select `myTFLVM` which is of type Virtual Machine.

5.) Select `Connect`.

6.) Select `SSH`.

7.) Copy and paste command string from `Login using local VM account` to terminal. Example command string: `ssh adminUser@20.192.192.192`

8.) Enter password (In your case, password is `Password!234`)

9.) You now have access to the linux terminal.
