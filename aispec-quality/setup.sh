#!/bin/bash
# Setup script for AISpec Quality Platform

set -e

echo "🚀 Setting up AISpec Quality Platform..."
echo ""

# Colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${BLUE}Step 1: Setting up backend...${NC}"
cd /Users/devjaime/.openclaw/workspace/aispec-quality/backend

echo "  → Running go mod tidy..."
go mod tidy

echo "  → Building backend..."
go build -o aispec-api ./cmd/api/main.go

echo -e "${GREEN}✓ Backend ready${NC}"
echo ""

echo -e "${BLUE}Step 2: Setting up frontend...${NC}"
cd /Users/devjaime/.openclaw/workspace/aispec-quality/frontend

echo "  → Installing npm dependencies..."
npm install

echo -e "${GREEN}✓ Frontend ready${NC}"
echo ""

echo -e "${BLUE}Step 3: Starting services...${NC}"
cd /Users/devjaime/.openclaw/workspace/aispec-quality

echo "  → Starting PostgreSQL and Redis via Docker..."
docker-compose up -d postgres redis minio

echo "  → Waiting for services to be ready..."
sleep 5

echo -e "${GREEN}✓ Services started${NC}"
echo ""

echo -e "${YELLOW}═══════════════════════════════════════════════════${NC}"
echo -e "${GREEN}🎉 Setup complete!${NC}"
echo ""
echo "To start the application:"
echo ""
echo "  Terminal 1 (Backend):"
echo "    cd /Users/devjaime/.openclaw/workspace/aispec-quality/backend"
echo "    go run cmd/api/main.go"
echo ""
echo "  Terminal 2 (Frontend):"
echo "    cd /Users/devjaime/.openclaw/workspace/aispec-quality/frontend"
echo "    npm run dev"
echo ""
echo "  Or use Docker (everything together):"
echo "    cd /Users/devjaime/.openclaw/workspace/aispec-quality"
echo "    docker-compose up -d"
echo ""
echo "Access:"
echo "  - API:    http://localhost:8080/api/v1/health"
echo "  - Web:    http://localhost:3000"
echo "  - Admin:  http://localhost:9001 (MinIO)"
echo -e "${YELLOW}═══════════════════════════════════════════════════${NC}"
