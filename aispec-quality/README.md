# AISpec Quality Platform

Platform for measuring code quality and ROI of AI-assisted development.

## Architecture

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   Next.js 14    │───▶│   Go Backend    │───▶│   PostgreSQL   │
│   (Frontend)    │    │   (API)         │    │   (Main DB)    │
└─────────────────┘    └─────────────────┘    └─────────────────┘
                                                      │
                                               ┌──────┘
                                               ▼
                                        ┌─────────────┐
                                        │  TimescaleDB │
                                        │  (Metrics)   │
                                        └─────────────┘
```

## Quick Start

### Prerequisites
- Go 1.23+
- Node.js 20+
- Docker & Docker Compose
- PostgreSQL 16+
- Redis 7+

### Backend

```bash
cd backend
go mod tidy
go run cmd/api/main.go
```

### Frontend

```bash
cd frontend
npm install
npm run dev
```

### Docker (Full Stack)

```bash
docker-compose up -d
```

## Environment Variables

```bash
# Backend
export DATABASE_URL="postgres://localhost:5432/aispec?sslmode=disable"
export REDIS_URL="redis://localhost:6379"
export JWT_SECRET="your-secret-key"
export GITHUB_CLIENT_ID="your-github-app-id"
export GITHUB_SECRET="your-github-secret"

# Frontend
export NEXT_PUBLIC_API_URL="http://localhost:8080/api/v1"
```

## API Endpoints

| Method | Endpoint | Description |
|--------|----------|-------------|
| POST | /api/v1/auth/github | GitHub OAuth |
| GET | /api/v1/projects | List projects |
| POST | /api/v1/projects | Create project |
| GET | /api/v1/projects/:id | Get project |
| POST | /api/v1/projects/:id/analyze | Trigger analysis |
| GET | /api/v1/analysis/:id | Get analysis |
| POST | /api/v1/roi/calculate | Calculate ROI |

## License

MIT
