# Tech Challenge - Fase 3 | ToggleMaster

Este repositório contém o código-fonte dos microsserviços, a infraestrutura como código (IaC), os manifestos de orquestração Kubernetes e os pipelines de CI/CD DevSecOps para o projeto **ToggleMaster**.

---

## 🏗️ Arquitetura e Tecnologias

* **Cloud Provider:** AWS (EKS, RDS PostgreSQL, ElastiCache Redis, DynamoDB, SQS, ECR)
* **Infraestrutura como Código (IaC):** Terraform
* **Orquestração de Contêineres:** Kubernetes (AWS EKS)
* **Estratégia de Deploy (GitOps):** ArgoCD
* **DevSecOps & CI/CD:** GitHub Actions com escaneamento de vulnerabilidades via **Trivy** e **Bandit**
* **Microsserviços:**
  * `auth-service` (Go) — Autenticação e gestão de acessos
  * `flag-service` (Python) — Gerenciamento de Feature Flags
  * `targeting-service` (Python) — Regras de segmentação de usuários
  * `evaluation-service` (Go) — Avaliação de flags com cache em Redis e envio de eventos via SQS
  * `analytics-service` (Python) — Consumidor de filas SQS com persistência no DynamoDB

---

## 📁 Estrutura do Repositório

```text
techchallenge3/
├── .github/workflows/    # Pipelines de CI/CD e testes DevSecOps
├── terraform/            # Módulos HCL para provisionamento na AWS
├── k8s/                  # Manifestos K8s (Deployments, Services, ConfigMaps, Ingress e ArgoCD)
│   ├── analytics-service/
│   ├── auth-service/
│   ├── evaluation-service/
│   ├── flag-service/
│   ├── targeting-service/
│   ├── argocd-app.yaml
│   ├── ingress.yaml
│   ├── namespace.yaml
│   └── secrets.yaml
├── analytics-service/    # Código-fonte Python e Dockerfile
├── auth-service/         # Código-fonte Go e Dockerfile
├── evaluation-service/   # Código-fonte Go e Dockerfile
├── flag-service/         # Código-fonte Python e Dockerfile
└── targeting-service/    # Código-fonte Python e Dockerfile
