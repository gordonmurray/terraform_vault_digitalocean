# Create a Vault server on DigitalOcean using Hashicorp Packer and Terraform

* Update packer/variables.json to add your DigitalOcean API key for Packer to use
* Update variables.tfvars to also include your DigitalOcean API key for Terraform to use

Once you have the API keys added to the config files, first create the Image in DigitalOcean using the following:

```
cd packer
# validate the packer file
packer validate -var-file=variables.json vault.json
# build the Image
packer build -var-file=variables.json vault.json
````

Once the Image has been built, you will see a new Image in your DigitalOcean account ready for Terraform to use:

```
# get out of the packer folder
cd ..
terraform init
# view the changes Terraform will make
terraform plan
# apply the changes
terraform apply
```