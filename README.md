# 📦 Terraform Project: WordPress + MySQL Deployment

## 🧾 Overview

This project automates the deployment of a **MySQL database on AWS RDS** and a **WordPress application on Minikube** using **Terraform**. It combines **cloud infrastructure** with **container orchestration**, showcasing integration between AWS and Kubernetes in a real-world microservices setup.

---

## 🚀 What’s Deployed

| Component         | Technology      | Description                                             |
|------------------|-----------------|---------------------------------------------------------|
| **RDS MySQL**     | AWS RDS         | MySQL 5.7 instance, publicly accessible                 |
| **WordPress App** | Kubernetes (Minikube) | 3-replica deployment of WordPress container         |
| **Service**       | NodePort        | Exposes WordPress via a Kubernetes service on Minikube |

---

## 🛠️ Prerequisites

- [Terraform](https://www.terraform.io/downloads)
- AWS CLI configured (`jayanth` profile)
- [Minikube](https://minikube.sigs.k8s.io/docs/start/)
- [kubectl](https://kubernetes.io/docs/tasks/tools/)
- Kubernetes cluster running locally via Minikube

---

## ⚙️ How It Works

### 🌐 AWS RDS MySQL Instance

- **Engine**: MySQL 5.7
- **Instance Type**: `db.t2.micro`
- **Storage**: 10 GB
- **Username/Password**: `jayanth / jayanth041`
- **Publicly accessible**: Yes

> You can connect to this RDS instance from the WordPress app or your local machine for database management.

### 📦 WordPress Kubernetes Deployment

- Runs 3 replicas of the `wordpress` Docker image
- Uses labels to manage deployments and services
- Exposed via a Kubernetes `NodePort` service for access from host machine

---

## 📌 Terraform Outputs

- RDS MySQL database details (via output `first`)

---

## 🧪 Usage

1. **Initialize Terraform**
   ```bash
   terraform init
