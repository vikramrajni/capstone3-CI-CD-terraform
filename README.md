# CI/CD Pipeline with Terraform, Jenkins, Docker, and AWS EC2

## Project Description

This project extends an existing CI/CD pipeline by automatically provisioning a new Amazon EC2 server instead of deploying the application to a pre-existing server.

The pipeline uses Terraform from within Jenkins to create the EC2 infrastructure, builds and publishes a Docker image for a Java Maven application, and deploys the application to the newly provisioned EC2 instance with Docker Compose.

## Project Objectives

- Install Terraform in the Jenkins environment.
- Add the Terraform configuration to the application Git repository.
- Update the Jenkinsfile to include infrastructure provisioning and application deployment stages.
- Provision a new EC2 instance automatically during the pipeline execution.
- Build and publish the Java Maven application's Docker image.
- Use SSH private key stored as Jenkins credential to SSH to the EC2 instance.
- Deploy the application to the provisioned EC2 instance using Docker Compose.

## Technologies Used

- Jenkins
- Terraform
- Amazon Web Services (AWS)
- Amazon EC2
- Docker
- Docker Compose
- Java
- Maven
- Git
- SSH

## Pipeline Workflow

The CI/CD pipeline performs the following four main steps:

### Step 1: Build the Java Maven Application

The pipeline compiles the source code, runs the configured Maven build process, and creates the application artifact.

### Step 2: Build and Push the Docker Image

Jenkins builds a Docker image containing the Java application and pushes the image to Docker Hub.

### Step 3: Provision an EC2 Instance with Terraform

Jenkins runs Terraform to:

1. Initialize the Terraform working directory.
2. Review or generate the infrastructure execution plan.
3. Apply the Terraform configuration.
4. Provision a new EC2 instance in AWS.
5. Retrieve the public IP address of the provisioned instance for the deployment stage.

### Step 4: Deploy the Application with Docker Compose

After the EC2 instance is available, Jenkins:

1. Connects to the EC2 instance through SSH.
2. Copies the deployment script and Docker Compose file to the server.
3. Pulls the application image from Docker Hub.
4. Starts the application using Docker Compose.



## Prerequisites

Before running the pipeline, ensure the following requirements are met:

- A Jenkins server or Jenkins container is available.
- Docker is installed and accessible to Jenkins.
- Terraform is installed in the Jenkins execution environment.
- The AWS CLI or AWS SDK credentials are available to the Jenkins job.
- The Jenkins Terraform process has permission to provision the required AWS resources.
- Docker and Docker Compose are available on the target EC2 instance, or the deployment/bootstrap process installs them.
- A Docker Hub repository is available for the application image.
- An SSH key pair is configured for the EC2 instance.



## Running the Pipeline

1. Clone or fork the repository.
2. Review the Terraform variables and AWS configuration.
3. Configure the required credentials in Jenkins.
4. Create a Jenkins pipeline that uses the repository's Jenkinsfile.
5. Run the pipeline.
6. Review the Jenkins console output for the Terraform, Docker, and deployment results.
7. Use the EC2 public IP address and configured application port to verify the application.

## Verification

After a successful pipeline run, verify that:

- The Maven application build completed successfully.
- The Docker image was pushed to Docker Hub.
- Terraform created the EC2 instance successfully.
- Jenkins retrieved the correct EC2 public IP address.
- Jenkins connected to the EC2 instance with the `server-ssh-key` credential.
- Docker Compose started the application container on the EC2 instance.
- The application is reachable on the expected port.

Useful commands on the EC2 instance include:
docker ps
docker compose ps

## Result

The completed pipeline automates both infrastructure provisioning and application deployment. Each pipeline execution can provision an EC2 server with Terraform, build and publish the Java Maven application's Docker image, and deploy the application to the new server using Docker Compose.
