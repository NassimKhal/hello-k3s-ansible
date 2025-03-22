# 🚀 Hello-k3s-ansible

> **Automated Deployment of a Lightweight Flask Application on Kubernetes (k3s) using AWS, Terraform, Docker, and Ansible**

---

## 📖 Project Overview

This project showcases an automated and highly optimized DevOps workflow, deploying a simple yet effective Flask "Hello World" application onto a minimalistic Kubernetes (k3s) cluster running on AWS infrastructure. Leveraging Infrastructure as Code (IaC) best practices, this solution emphasizes efficiency, security, and automation to achieve seamless, cost-free deployment.

---

## 🌐 Technologies Used

- **Cloud Provider:** AWS (Free Tier)
- **Infrastructure as Code (IaC):** Terraform
- **Configuration Management & Automation:** Ansible
- **Containerization:** Docker
- **Container Orchestration:** Kubernetes (k3s)
- **CI/CD & Testing:** GitHub Actions (Unit & Security Tests)

---

## 🎯 Project Objectives

- Demonstrate proficiency in essential DevOps methodologies and tools.
- Maintain optimized resource usage (AWS Free Tier).
- Implement professional-level automation and configuration management.
- Showcase clearly structured and meticulously documented code, suitable for enterprise-level peer reviews.

---

## 📂 Project Structure

```
Hello-k3s-ansible/
├── ansible/        # Ansible playbooks and inventory files
├── terraform/      # Terraform configuration files for AWS infrastructure
├── flask-app/      # Python Flask application source code
├── docker/         # Dockerfiles and Docker Compose files
└── kubernetes/     # Kubernetes YAML manifests for k3s deployment
```

---

## ✅ Project Achievements

### 🏗️ Infrastructure Setup with Terraform

- Provisioned AWS EC2 instance (`t2.micro`, Ubuntu 22.04) in region `us-east-1`.
- Configured secure access through SSH and HTTP using Security Groups.
- Automated SSH key pair creation and attachment via Terraform.

### ⚙️ Automated Server Provisioning with Ansible

- Developed an Ansible inventory for managing remote servers.
- Created robust Ansible playbooks to automate:
  - Installation of Docker Engine (v28.0.2) and Docker Compose.
  - Deployment of lightweight Kubernetes distribution (k3s v1.31.6).
- Ensured all Ansible tasks are clearly documented, repeatable, and idempotent.

### 🐳 Containerization & Dockerization

- Containerized Flask application using an optimized Dockerfile (multi-stage build, Alpine-based).
- Built and tested ultra-lightweight Docker images.
- Deployed a modern, clean UI using Flask and Bootstrap for enhanced frontend experience.
- Docker image available publicly on Docker Hub:
  - [fragmendal/flask-k3s-app](https://hub.docker.com/r/fragmendal/flask-k3s-app)

### 🚀 Kubernetes Deployment & Automation

- Created Kubernetes Deployment and Service YAML manifests.
- Automated deployment of Flask application onto Kubernetes (k3s) using Ansible.
- Verified the Flask application is accessible via Kubernetes NodePort externally.

---

## 📌 Completed Sprints

| Sprint # | Description                                    | Status          |
|----------|------------------------------------------------|-----------------|
| 1        | Project Initialization and AWS Setup           | ✅ Completed    |
| 2        | Infrastructure as Code with Terraform          | ✅ Completed    |
| 3        | Automation and Provisioning with Ansible       | ✅ Completed    |
| 4        | Flask Application Containerization with Docker | ✅ Completed    |
| 5        | Kubernetes (k3s) Deployment & Automation       | ✅ Completed    |

---

## 🚧 To-Do List (Next Sprints)

- [ ] **Sprint 6:** Implement CI/CD pipelines with GitHub Actions, integrating unit and security tests.
- [ ] **Optimization & Security Review:** Resource optimization, security best practices review, and advanced monitoring.

---

## 🛡️ Security & Optimization

- Continuous monitoring and cost management practices to ensure zero-cost AWS usage.
- Secure handling of AWS credentials (using AWS CLI, no hard-coded keys).
- Clearly documented SSH key management and automated provisioning for enhanced security.

---

## 📈 CI/CD Pipeline (Coming Soon)

Automated GitHub Actions pipelines will include:

- Automated Docker image builds and security scans.
- Automated deployments to Kubernetes (k3s).
- Integrated testing (unit and security tests) for continuous validation.

---

## 🎨 Application UI (Flask)

Minimalist Flask application with modern and clean UI powered by Bootstrap 5.

---

## 🧑‍💻 Author

**Nassim Khalfa**  
DevOps Engineer   
🔗 [Nassim Khalfa](https://www.linkedin.com/in/nassim-khalfa)  

---

⭐ **If you find this project interesting or valuable, please consider giving it a star!**