# Create a Vault server on DigitalOcean using Hashicorp Packer and Terraform

The overall process is that Packer is used to create an Image, which is a preconfigured server that Terraform can then start up in your account.

### To get up and running

You will need a DigitalOcean account and have an API key ready.

* Update packer/variables.json to add your DigitalOcean API key for Packer to use
* Update variables.tfvars to also include your DigitalOcean API key for Terraform to use

Once you have the API keys added to the config files, first create the Image in your DigitalOcean account using the following:

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

You will not have a single Vault server running in your account. To get its IP address, either look in your DigitalOcean account, or run `terraform show` to see the IP address. You should be able to open your web browser and log in at that IP address at http://{your IP address}:8200

