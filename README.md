# Hello-k3s-ansible

A minimal, production-style DevOps project to deploy a lightweight Flask web application using **Terraform Cloud**, **GitHub Actions**, **Ansible**, **Docker**, and **K3s on AWS EC2** — all within the **AWS Free Tier**.

This project follows **industry-standard best practices**, including secure CI/CD pipelines, infrastructure-as-code, Kubernetes deployment, and automated provisioning. It was created to demonstrate real-world DevOps skills in a simple, understandable, and recruiter-friendly way.

---

## 🚀 Tech Stack

| Layer            | Tooling                         |
|------------------|----------------------------------|
| IaC              | Terraform Cloud (remote backend) |
| Provisioning     | Ansible                         |
| Containerization | Docker                          |
| Orchestration    | K3s (lightweight Kubernetes)     |
| CI/CD            | GitHub Actions + Terraform Cloud |
| Cloud Provider   | AWS Free Tier (EC2)              |

---

## ✅ Completed Sprints

### ✅ Sprint 1: Project Initialization
- ✅ Defined project goals and DevOps stack
- ✅ Chose lightweight architecture (Flask + K3s)
- ✅ Established Agile-based Sprint methodology

### ✅ Sprint 2: Terraform Cloud Setup
- ✅ Installed Terraform CLI and connected to Terraform Cloud
- ✅ Created AWS EC2 instance using `t2.micro`
- ✅ Configured `main.tf`, `variables.tf`, and `outputs.tf`
- ✅ Automatically generates Ansible inventory from EC2 IP

### ✅ Sprint 3: Ansible Provisioning
- ✅ Installed Docker and K3s on the EC2 instance
- ✅ WSL (Ubuntu) used to run Ansible locally and test configuration
- ✅ Automated provisioning and verified Kubernetes installation
- ✅ Refactored Terraform to inject CI SSH key using `user_data`

### ✅ Sprint 4: Docker + Flask Application
- ✅ Built a minimal Flask app with a basic HTML UI
- ✅ Used multi-stage Docker build for smallest possible image
- ✅ Verified local execution and pushed to Docker Hub (`fragmendal/hello-k3s-flask`)
- ✅ Docker image build/push automated via GitHub Actions
- ✅ Workflow triggers only on Flask app changes

### ✅ Sprint 5: Kubernetes Deployment
- ✅ Created Kubernetes manifests (`deployment.yaml`, `service.yaml`)
- ✅ Applied manifests on K3s cluster via Ansible
- ✅ Exposed app using NodePort service (`:30001`)
- ✅ App publicly accessible via EC2 IP + NodePort

### ✅ Sprint 6: CI/CD Automation
- ✅ GitHub Actions dynamically fetches EC2 IP from Terraform Cloud
- ✅ SSHs using CI key securely stored in GitHub Secrets
- ✅ Runs Ansible provisioning end-to-end via CI pipeline
- ✅ Entire workflow is idempotent, automated, and secure
- ✅ OIDC authentication replaces static AWS credentials
- ✅ Workflow runs only after successful Terraform Apply

---

## 🧪 How It Works

1. **Terraform Cloud** provisions the EC2 instance
2. The instance is configured with two SSH keys:
   - Your **personal key** for manual access
   - A **CI key** injected via `user_data` for GitHub Actions
3. **GitHub Actions** detects new IP from Terraform Cloud using the `paambaati/tfc-output-action` plugin
4. Ansible connects via SSH to provision Docker, K3s, and deploy the Flask app
5. The app is available at `http://<ec2_ip>:30001`

---

## ⚙️ CI/CD Workflows

### 🔧 Terraform Workflow (Terraform Cloud VCS-connected)
- Triggers on changes to `.tf` files
- Applies infrastructure changes automatically

### 🤖 Ansible + K3s Workflow
**File:** `.github/workflows/ansible.yml`
- Triggers on changes to `ansible/**` or `kubernetes/**`
- Fetches EC2 IP dynamically from Terraform Cloud
- SSHs into EC2 using CI key
- Provisions Docker, K3s, and deploys the app

---

## 🛡️ Security Best Practices
- 🧑‍💻 Developer and CI access keys are **separated**
- 🔐 SSH private keys stored in **GitHub Secrets**
- ☁️ AWS access via **OIDC GitHub Identity Federation**
- 🧱 Terraform IAM user has a **minimal IAM policy**

---

## 🧰 Dev Environment
- **Windows 11** + **WSL2 Ubuntu**
- GitHub, Terraform CLI, AWS CLI, Docker Desktop
- IDE: Visual Studio Code

---

## 📝 To-Do List (Backlog)

| Priority | Task                                                  |
|----------|-------------------------------------------------------|
| 🔜 High   | Improve IAM policy for Terraform Cloud (least privilege) |
| 🔜 High   | Automate Terraform Apply before Ansible CI workflow   |
| 🧪 Medium | Add basic unit tests & security scans in Flask app    |
| 🎨 Low    | Add custom domain and SSL (with Route53 + ACM)       |
| 💡 Bonus  | Auto-destroy old EC2 instance after idle period       |

---

## 👨‍💻 Author
**Nassim Khalfa** — DevOps Junior Engineer
> This project was created as part of a DevOps portfolio to showcase skills in infrastructure automation, containerization, and cloud-native workflows.

---

## 📎 License
MIT License

