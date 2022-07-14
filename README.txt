## Introduction:
This set of Terrafrom scripts create the Code Pipeline that will be used to deploy the infrastructure

## Pre-requisites:
1. Clone Project
2. install terraform (https://www.terraform.io/downloads)
3. Register for an aws account
4. Set up the aws client
5. configure the varfile.tfvars with the relevant details for your environment
6. Set up Secret Manager to hold your dockerhub credentials
7. Create a Codestar connection to the Github repo
9. run the scripts using the command
```terraform init```
```terraform plan -var-file=varfile.tfvars```
```terraform apply -var-file=varfile.tfvars -auto-approve```
10. Cleanup the environment after you finish using the command
```terraform destroy -var-file=varfile.tfvars```

