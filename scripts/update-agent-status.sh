#!/bin/bash
# Script para actualizar el estado del agente en /tmp/openclaw-agent-status.json

STATUS_FILE="/tmp/openclaw-agent-status.json"

# Obtener info del sistema
UPTIME_INFO=$(uptime | sed 's/.*up/up/' | sed 's/,.*load/cpu/' | sed 's/ users.*//')

# Contar sesiones activas (aproximado)
SESSION_COUNT=$(ps aux | grep -c "[o]penclaw\|[a]gent" 2>/dev/null || echo "0")

# Estado del agente
AGENT_STATUS="online"

# timestamp actual
TIMESTAMP=$(date -u +"%Y-%m-%dT%H:%M:%SZ")

# Crear JSON
cat > "$STATUS_FILE" << EOF
{
  "status": "$AGENT_STATUS",
  "agent": "main",
  "lastUpdate": "$TIMESTAMP",
  "uptime": "$UPTIME_INFO",
  "sessions": [],
  "jobs": [
    {"name": "Reporte Matutino 6AM", "schedule": "0 6 * * *", "enabled": true},
    {"name": "Reporte Medio Día 12PM", "schedule": "0 12 * * *", "enabled": true}
  ],
  "activity": [
    {"time": "$TIMESTAMP", "message": "Status actualizado"}
  ],
  "errors": []
}
EOF

echo "✅ Status actualizado en $STATUS_FILE"
cat "$STATUS_FILE"
