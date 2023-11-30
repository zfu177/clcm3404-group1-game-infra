# CLCM3404 Course Project - Implementing a Game Project on AWS Cloud

## Infrastructure Repository (Terraform)

### Usage

#### Apply the terraform script
```bash
terragrunt plan
terragrunt apply
```

#### Add the IAM Credentials to the Github Actions Secret
After apply the template, go to AWS Systems Manager Console, retreive the credentials from the SSM parameter "iam_user_ssm_parameter_path", click "Show decrypted value", add the access key and secret key to the GitHub Actions Secrets