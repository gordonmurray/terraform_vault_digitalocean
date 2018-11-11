Packer image file
-------------------

**Validate**

> packer validate -var-file=variables.json vault.json

**Build the image**

> packer build -var-file=variables.json vault.json