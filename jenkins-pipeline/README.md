# Grid Singularity Devops Challenge  

Your goals for this challenge:

1. Create an automation using Terraform or Cloudformation to provision one Linux VM in AWS capable to run docker containers and with the port 80 exposed to the internet.
2. Create a Dockerfile of a nginx container.
3. Create a CI/CD pipeline using Travis/Github Actions/Jenkins to build and deploy the container in the Linux VM.
4. Create a README with all necessary steps in order to run your automation.

We would like to see your considerations for credentials handling in this scenario.  
The challenge is expected to take between 2-4 hours.  

In order to submit your solution a fork of this repo has to be created, and the solution can be committed to the fork.


# Solution (Terraformed NGINX)

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
