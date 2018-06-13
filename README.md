## Terraform Demo Template for NGIX and Docker on AWS EC2

**An open source FullStack:** Deploy a simple infrastructure with NGIX and Docker on AWS EC2

**Author:** Gonzalo Plaza <gonzalo@verize.com>

### Requirements

- AWS CLI installed and configured (with valid aws account credentials)
- Terraform CLI : https://www.terraform.io/downloads.html
- An AWS key-pair created on your prefered region (example: eu-west-3)

### Instructions

1. Clone this repository

2. Install project plugins

```
terraform init
```

3. Execute Plan: Type your region, your key-pair name and port

```
terraform plan
```

4. Check everything is OK and deploy infrastructure on AWS
```
terraform apply
```

5. Check server connection via public IP or SSH
```
ssh -i your-pem-file.pem ubuntu@PUBLIC_IP_OUTPUT
```

6. Destroy your demo infrastructure after testing
```
terraform destroy
```

### Licensing:

The code in this project is licensed under [MIT LICENSE](LICENSE). Read file for more information.