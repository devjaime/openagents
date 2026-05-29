#!/bin/bash
# Daily Blog Generator - Vocari.cl / Jaime Hernández
# Runs at 3:30 AM daily to generate blog post about Home Assistant

set -e

BLOG_DIR="/Users/devjaime/.openclaw/workspace/devjaimeblog/src/pages/blog"
MEMORY_DIR="/Users/devjaime/.openclaw/workspace/memory"
HA_SCRIPT="/Users/devjaime/.openclaw/workspace/projects/homeassistant/ha.sh"
DATE=$(date +%Y-%m-%d)
DATETIME=$(date "+%Y-%m-%d %H:%M:%S")
FILENAME="${DATE}_Diario-Automatico"

echo "=== Generando entrada de blog: $DATE ==="

# 1. Get Home Assistant states
echo "Obteniendo estados de Home Assistant..."
HA_STATES=$($HA_SCRIPT entities 2>/dev/null | head -c 10000 || echo "No se pudo obtener estados de HA")

# 2. Get yesterday's memory for summary
YESTERDAY=$(date -v-1d +%Y-%m-%d)
YESTERDAY_MEMORY=""
if [ -f "$MEMORY_DIR/${YESTERDAY}.md" ]; then
    YESTERDAY_MEMORY=$(cat "$MEMORY_DIR/${YESTERDAY}.md" | head -100)
fi

# 3. Build prompt for Ollama with minimax
PROMPT="Eres un asistente AI que escribe un blog técnico personal. Escribe una entrada de diario para Jaime Hernández.

Fecha y hora actual: $DATETIME

## Estados de Home Assistant (últimas entidades):
$HA_STATES

## Resumen del día anterior (si existe):
$YESTERDAY_MEMORY

## Estructura requerida:
1. Título: 'Diario Automático - [fecha]'
2. Estado del sistema smart home (cámaras, temperatura, dispositivos)
3. Resumen de lo que se trabajó ayer
4. Tareas pendientes identificadas
5. Reflexión breve

Escribe en español, tono técnico pero personal. Máximo 400 palabras. No uses markdown demasiado complejo. Incluye emojis relevantes."

# 4. Generate content with Ollama (minimax-m2.5:cloud)
echo "Generando contenido con Ollama minimax-m2.5:cloud..."
CONTENT=$(curl -s -X POST "http://127.0.0.1:11434/api/generate" \
  -H "Content-Type: application/json" \
  -d "$(jq -n --arg prompt "$PROMPT" '{
    "model": "minimax-m2.5:cloud",
    "prompt": $prompt,
    "stream": false
  }')" | jq -r '.response' 2>/dev/null || echo "Error")

# Fallback if API fails
if [ -z "$CONTENT" ] || [ "$CONTENT" = "Error" ] || [ "${CONTENT:0:5}" = "Error" ]; then
    CONTENT="# Diario Automático - $DATE

*$DATETIME*

## Estado del Sistema

- Home Assistant: Activo
- Cámaras: Disponibles
- Smart home: En funcionamiento

## Notas

Entrada automática generada por el sistema de automatización personal.

---
*Generado automáticamente a las 3:30 AM*"
fi

# 5. Create blog post
cat > "$BLOG_DIR/${FILENAME}.md" << EOF
---
layout: "../../layouts/BlogLayout.astro"
title: "Diario Automático - $DATE"
description: "Entrada automática del sistema de automatización personal"
tags: ["Automático", "Diario", "Smart Home"]
time: 2
featured: false
timestamp: "${DATE}T03:30:00-0300"
filename: "$FILENAME"
---

$CONTENT

---
*Generado automáticamente el $DATETIME*
EOF

echo "=== Blog guardado: $BLOG_DIR/${FILENAME}.md ==="

# 6. Commit to git and push
echo "=== Haciendo commit y push a GitHub..."
cd "$BLOG_DIR" && git add "${FILENAME}.md" && git commit -m "Diario automático $DATE" && git push origin main

echo "=== Proceso completado ==="
