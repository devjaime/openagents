#!/usr/bin/env bash
set -euo pipefail

OPENCLAW_BIN="${OPENCLAW_BIN:-/Users/devjaime/Library/pnpm/openclaw}"
CONFIG_PATH="${OPENCLAW_CONFIG:-$HOME/.openclaw/openclaw.json}"
MAX_ATTEMPTS="${OPENCLAW_HEALTH_ATTEMPTS:-20}"
SLEEP_SECS="${OPENCLAW_HEALTH_INTERVAL:-1}"

if [[ ! -f "$CONFIG_PATH" ]]; then
  echo "Config no encontrado: $CONFIG_PATH" >&2
  exit 1
fi

TOKEN="$(jq -r '.gateway.auth.token // empty' "$CONFIG_PATH")"
PORT="$(jq -r '.gateway.port // 18789' "$CONFIG_PATH")"
URL="ws://127.0.0.1:${PORT}"

if [[ -z "$TOKEN" ]]; then
  echo "gateway.auth.token vacío en $CONFIG_PATH" >&2
  exit 1
fi

echo "[1/5] Deteniendo gateway..."
OPENCLAW_GATEWAY_TOKEN="$TOKEN" "$OPENCLAW_BIN" gateway stop || true

echo "[2/5] Limpiando procesos huérfanos de memoria..."
pkill -f '/Users/devjaime/.openclaw/extensions/openclaw-neo4j-memory/server/main.py' >/dev/null 2>&1 || true

echo "[3/5] Reinstalando servicio..."
OPENCLAW_GATEWAY_TOKEN="$TOKEN" "$OPENCLAW_BIN" gateway install --force

echo "[4/5] Iniciando gateway..."
OPENCLAW_GATEWAY_TOKEN="$TOKEN" "$OPENCLAW_BIN" gateway start

echo "[5/5] Validando RPC (reintentos: ${MAX_ATTEMPTS})..."
for ((i=1; i<=MAX_ATTEMPTS; i++)); do
  if OPENCLAW_GATEWAY_TOKEN="$TOKEN" "$OPENCLAW_BIN" gateway status --url "$URL" --require-rpc >/dev/null 2>&1; then
    echo "OK: OpenClaw estable en $URL"
    exit 0
  fi
  sleep "$SLEEP_SECS"
done

echo "ERROR: Gateway no respondió RPC a tiempo en $URL" >&2
OPENCLAW_GATEWAY_TOKEN="$TOKEN" "$OPENCLAW_BIN" gateway status --url "$URL" || true
exit 1
