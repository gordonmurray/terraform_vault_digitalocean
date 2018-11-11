# get the pre made vault master image
data "digitalocean_image" "vault" {
  name = "vault"
}

# create vault
module "vault" {
  source             = "./modules/digitalocean/droplet"
  image              = "${data.digitalocean_image.vault.image}"
  name               = "vault"
  region             = "lon1"
  size               = "1gb"
  backups            = "false"
  monitoring         = "true"
  ssh_keys           = ["${module.my_ssh_key.ssh_fingerprint}"]
  private_networking = "true"

  # get the current public IP and update the Vault settings file
  remote_exec_command = "sed -i.bak s/127.0.0.1/`curl ifconfig.co`/g /etc/vault.hcl && sudo service vault restart"
}