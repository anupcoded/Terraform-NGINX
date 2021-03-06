
# Terraformed NGINX

Deploy NGINX stable version in a [docker container](https://hub.docker.com/_/nginx?tab=tags) on an AWS EC2 instance running Ubuntu 20.04 using [Terraform](https://www.terraform.io/).

The terraform script starts an AWS EC2 runiing Ubuntu 20.04 having docker installed.

## Usage

Before you run terraform you need to change the default values of `ACCESS-KEY-HERE` and `SECRET-KEY-HERE` terraform variables defined in `terraform.tvars` :
```
# AWS Settings
aws_access_key = "ACCESS-KEY-HERE"
aws_secret_key = "SECRET-KEY-HERE"
```

### Run 'terraform plan' for creating 

    terraform plan

### Run 'terraform apply' for applying changes

    terraform apply


### Run 'terraform destroy' for destroying the instance

    terraform destroy

## Configuring Pipeline using Jenkins

1. Start a Jenkins instance and build a pipeline job.
2. The pipeline groovy script 'nginx-deploy.groovy' can be pasted into the jenkins pipeline job with the Defnitione "pipeline script".
3. Save the configuration and Build.
4. The pipeline has three steps with a final Test step to check if the Nginx container is deployed.

## Healtcheck

The healtcheck for the Nginx container can checked with the docker command.
```
docker ps
```
