
# Project Description

This project integrates the server provisioning stage into a complete CI/CD pipeline, enabling automated infrastructure deployment rather than deploying applications to an existing server.

## Objectives

- Create an SSH key pair for AWS EC2 server
- Install "ssh agent" plugin in Jenkins
- Install Terraform inside the Jenkins container
- Add Terraform configuration files to the application's Git repository
- Modify the Jenkinsfile to include a provisioning stage
- Automate EC2 instance provisioning as part of the CI/CD workflow

## CI/CD Pipeline Workflow

The complete CI/CD process consists of the following stages:

### CI Stage: Build and Package Application

- Build the Java application using "maven"
- "buildJar()" function is defined in shared library folder (vars)
- Package the application artifact

### CI Stage: Build and Push Docker Image

- Build the Docker image
  "buildImage()" function is defined in shared library folder (vars)
- login to Dockerhub
- Push the image to Docker Hub

### CD Stage: Provision Infrastructure with Terraform

- Execute Terraform commands from Jenkins
- Provision an Amazon EC2 instance automatically
- Execute a script to install docker on the EC2 server


### CD Stage: Deploy Application

- Connect to the newly provisioned EC2 instance
- Deploy the latest application version using Docker Compose
  (Jenkins will SSH to the EC2 instance and execute script - "server-cmds.sh" file)

