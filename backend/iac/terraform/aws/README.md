# AWS Terraform Infrastructure as Code

Note that the backend state bucket was created manually.
Create a `.tfbackend` (git ignored) backend config file with the following content, settings values appropriately:
```ini
region = "aws-region-x"
bucket = "bucket-name"
```

```shell
terraform init -backend-config=./.tfbackend
```
