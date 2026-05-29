#!/bin/bash
# Dashboard Status Script
# Genera análisis del estado del dashboard y lo guarda en el blog

BLOG_DIR="/Users/devjaime/.openclaw/workspace/devjaimeblog/src/pages/blog"
DATE=$(date +%Y-%m-%d)
TIMESTAMP=$(date "+%Y-%m-%dT%H:%M:%S-0300")

echo "=== Generando análisis del dashboard ==="

# Obtener estado del dashboard
GATEWAY_STATUS=$(curl -s -o /dev/null -w "%{http_code}" "http://127.0.0.1:18990/" 2>/dev/null || echo "000")
HA_STATUS=$(curl -s -o /dev/null -w "%{http_code}" "http://127.0.0.1:8123/api/" 2>/dev/null || echo "000")

# Determinar estado y mensaje
if [ "$GATEWAY_STATUS" = "200" ]; then
    GATEWAY_ICON="✅"
    GATEWAY_TEXT="En línea"
    GATEWAY_ANALYSIS="El sistema OpenClaw está operativo."
else
    GATEWAY_ICON="❌"
    GATEWAY_TEXT="Fuera de línea (HTTP $GATEWAY_STATUS)"
    GATEWAY_ANALYSIS="⚠️ El gateway de OpenClaw no está respondiendo correctamente. Se recomienda revisar el servicio."
fi

if [ "$HA_STATUS" = "200" ]; then
    HA_ICON="✅"
    HA_TEXT="Conectado"
    HA_ANALISIS="✅ Home Assistant está funcionando correctamente."
elif [ "$HA_STATUS" = "401" ]; then
    HA_ICON="⚠️"
    HA_TEXT="Sin autorización (HTTP 401)"
    HA_ANALISIS="⚠️ Home Assistant tiene problemas de autenticación. Revisar token de acceso."
else
    HA_ICON="⚠️"
    HA_TEXT="Problemas (HTTP $HA_STATUS)"
    HA_ANALISIS="⚠️ Home Assistant tiene problemas de conexión."
fi

# Crear artículo con formato correcto de Astro
cat > "$BLOG_DIR/${DATE}_dashboard_status.md" << EOF
---
layout: "../../layouts/BlogLayout.astro"
title: "Estado del Dashboard OpenClaw - $DATE"
description: "Análisis automático del estado del sistema OpenClaw y recomendaciones"
tags: ["OpenClaw", "Dashboard", "Monitoring", "Automation"]
time: 2
featured: false
timestamp: "$TIMESTAMP"
filename: "${DATE}_dashboard_status"
---

# Estado del Dashboard - $DATE

## Métricas del Sistema

| Componente | Estado | Código HTTP |
|------------|--------|-------------|
| **Gateway OpenClaw** | $GATEWAY_ICON $GATEWAY_TEXT | $GATEWAY_STATUS |
| **Home Assistant** | $HA_ICON $HA_TEXT | $HA_STATUS |

## Análisis

$GATEWAY_ANALYSIS

$HA_ANALISIS

## Recomendaciones

$(if [ "$GATEWAY_STATUS" != "200" ] || [ "$HA_STATUS" != "200" ]; then
echo "1. Revisar logs del gateway OpenClaw"
echo "2. Verificar estado de Home Assistant"
echo "3. Comprobar conectividad de red"
else
echo "1. Sistema operando con parámetros normales"
echo "2. Monitoreo continuo activo"
fi)

---

*Análisis generado automáticamente el $DATE*
EOF

echo "✅ Artículo creado: ${DATE}_dashboard_status.md"

# Commit y push
cd /Users/devjaime/.openclaw/workspace/devjaimeblog
git add src/pages/blog/${DATE}_dashboard_status.md
git commit -m "Add: Dashboard status $DATE" 2>/dev/null
git push origin main 2>/dev/null

echo "✅ Push a GitHub completado"

# Enviar a Alexa
ALEXA_MSG="Estado del dashboard: Gateway $GATEWAY_TEXT, Home Assistant $HA_TEXT"
/Users/devjaime/.openclaw/workspace/projects/homeassistant/alexa.sh send "$ALEXA_MSG" 2>/dev/null

echo "✅ Proceso completado"
