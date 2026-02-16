## Project Summary

This project automates the deployment of a Strapi application using Docker, GitHub Actions, Terraform, and AWS EC2.

The application is containerized using Docker and automatically built and pushed to Docker Hub whenever code is pushed to the main branch. Infrastructure is managed using Terraform, which provisions an EC2 instance, installs Docker, pulls the latest image, and runs the Strapi container. The deployment is triggered via a GitHub Actions workflow.

The system demonstrates:

Containerization with Docker

CI pipeline using GitHub Actions

CD pipeline with Terraform

Infrastructure as Code (IaC)

Automated cloud deployment on AWS

Once deployed, the Strapi application is accessible via the EC2 public IP address.

## Technologies Used

Strapi – Headless CMS

Node.js – Backend runtime

Docker – Containerization

GitHub Actions – CI/CD

Terraform – Infrastructure as Code

AWS EC2 – Cloud compute

Docker Hub – Container registry
