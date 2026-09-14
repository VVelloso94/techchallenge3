# 🚀 Tech Challenge 2 - Arquitetura de Microsserviços e Cloud

Este repositório contém a implementação do **Tech Challenge 2** (FIAP), consistindo em uma arquitetura de microsserviços orientada a eventos, conteinerizada com Docker e orquestrada em ambiente Kubernetes (Amazon EKS).

---

## 📋 Sobre o Projeto

O sistema gerencia autenticação, avaliação, segmentação e *feature flags* de forma distribuída, enviando dados de auditoria e telemetria de forma assíncrona para processamento analítico.

---

## 🏗️ Arquitetura dos Microsserviços

O ecossistema é composto por cinco microsserviços principais:

1. **`auth-service` (Go):** Responsável pela autenticação, gestão de usuários e segurança.
2. **`evaluation-service` (Go):** Responsável por avaliar regras e estados de *feature flags*.
3. **`flag-service` (Python / Flask):** Gerenciamento e controle das *flags*.
4. **`targeting-service` (Python):** Serviço de segmentação de público-alvo.
5. **`analytics-service` (Python):** Worker assíncrono que consome mensagens de uma fila SQS e persiste dados consolidados no DynamoDB.

---

## 💾 Camada de Dados e Mensageria

* **Amazon RDS (PostgreSQL):** Banco relacional transacional para dados consistentes.
* **Amazon ElastiCache (Redis):** Cache em memória de alta performance para consulta rápida de estados.
* **Amazon SQS (`techchallenge2-queue`):** Fila de mensagens para comunicação assíncrona.
* **Amazon DynamoDB (`ToggleMasterAnalytics`):** Banco NoSQL otimizado para alta taxa de gravação de telemetria.

---

## 🛠️ Tecnologias Utilizadas

* **Linguagens:** Go e Python (Flask)
* **Containerização:** Docker & Docker Compose
* **Orquestração:** Kubernetes (Amazon EKS), Ingress Controller, HPA (Horizontal Pod Autoscaler)
* **Cloud:** AWS (RDS, DynamoDB, SQS, ALB)

---

## 🚀 Como Executar Localmente via Docker Compose

Certifique-se de ter o Docker e o Docker Compose instalados na sua máquina.

1. Clone o repositório:

   git clone [https://github.com/VVelloso94/techchallenge2.git](https://github.com/VVelloso94/techchallenge2.git)
   cd techchallenge2

2. Suba os containers ignorando o cache, se necessário:

docker compose build --no-cache && docker compose up

Estrutura do Repositório

├── auth-service/         # Microsserviço de Autenticação (Go)
├── evaluation-service/   # Microsserviço de Avaliação (Go)
├── flag-service/         # Microsserviço de Feature Flags (Python)
├── targeting-service/    # Microsserviço de Segmentação (Python)
├── analytics-service/    # Microsserviço de Analytics e SQS (Python)
├── docker-compose.yml    # Orquestração local dos serviços
└── README.md             # Documentação do projeto
