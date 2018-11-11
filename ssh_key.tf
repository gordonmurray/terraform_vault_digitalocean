module "my_ssh_key" {
  source     = "./modules/digitalocean/ssh_key"
  name       = "vault_ssh_key"
  public_key = "${file("/home/ubuntu/.ssh/id_rsa.pub")}"
}
