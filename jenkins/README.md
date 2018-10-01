
## Continuous Delivery Pipeline for Amazon ECS Using Jenkins, GitHub, and Amazon ECR

Demo Project is intended to help to set up and configure a continuous delivery pipeline for Amazon Elastic Container Service (Amazon ECS) using Jenkins, GitHub, and the Amazon Elastic Container Registry (Amazon ECR). The pipeline builds Docker images from a GitHub repository, pushes those images to an ECR registry, creates an ECS task definition, and then uses that task definition to create a service on the ECS cluster. We use Jenkins to orchestrate the different steps in the workflow.

## Official documentation
https://docs.aws.amazon.com/AWSGettingStartedContinuousDeliveryPipeline/latest/GettingStarted/CICD_Jenkins_Pipeline.html#create-ecr-registry

1) Make a change source code in your repository and push changes to GitHub 

2) Jenkins pulls the code from your Git repository into a workspace

3) builds the container image, pushes the container image to ECR

4) creates a task and service definition, and starts your service.

Without dynamic ports, only one instance of a service can be deployed per container as the port being used by the instance cannot be used by any other instance. When you update the service, it will try to restart all its instances and if more than one instances are being started on a single EC2 container, the startup will fail.

Better to use docker containers with dynamic port mapping in ECS cluster.
