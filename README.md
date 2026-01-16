# PulseStream

PulseStream is a high-performance, Content-as-a-Service (CaaS) platform designed for creators. It combines newsletter delivery, real-time audio/video streaming, and deep analytics. Built with a focus on extreme scalability, multi-tenancy, and resilience.

## 🏗 Architectural Decisions & Engineering Excellence

This project serves as a showcase of senior-level engineering patterns using **Ruby 4.0.1** and **Rails 8.1.2**.

### 1. Multi-tenant Isolation
To ensure data security and scalability, PulseStream implements a **Row-Level multi-tenancy** strategy. This allows creators to have dedicated subdomains and isolated data environments without the overhead of separate databases for every tenant.

### 2. Modern Background Processing (Solid Queue)
We have moved away from Redis-backed queues in favor of **Solid Queue**. This simplifies the infrastructure while maintaining the ability to handle thousands of concurrent jobs (email dispatches, media processing) using the database as the persistence layer, optimized for the Rails 8 ecosystem.

### 3. Performance & Edge Caching
- **Solid Cache:** Leverages the database for fast, persistent caching, reducing external dependencies.
- **Turbo 8 Morphing:** Implemented to provide a "Single Page Application" feel without the complexity of heavy JS frameworks, ensuring seamless state transitions during live streams.

### 4. Event-Driven Payments
Integrations with payment gateways (Stripe/Iugu) are handled via an **Event-Driven Architecture**. We implement strict **Idempotency Keys** to prevent duplicate billing and a "Grace Period" logic to handle subscription churn gracefully.

### 5. Deployment with Kamal 2
PulseStream is deployed using **Kamal 2**, enabling zero-downtime deployments on bare-metal or VPS environments. This avoids PaaS lock-in and significantly reduces infrastructure costs.

## 🛠 Tech Stack

- **Language:** Ruby 4.0.1 (YJIT enabled)
- **Framework:** Rails 8.1.2
- **Database:** PostgreSQL (Primary), SQLite (Development & Solid Cache)
- **Frontend:** Hotwire (Turbo 8, Stimulus)
- **Asset Pipeline:** Propshaft
- **Observability:** OpenTelemetry & Mission Control Jobs

## 🚀 Getting Started

### Prerequisites
- Ruby 4.0.1
- PostgreSQL 16+
- Docker (for external services)

### Installation
1. Clone the repository:
   ```bash
   git clone [https://github.com/dpserretti/pulse-stream.git](https://github.com/dpserretti/pulse-stream.git)