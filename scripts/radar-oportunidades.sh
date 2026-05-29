#!/bin/bash
# Radar de Oportunidades Tech/IA
# Ejecuta análisis de mercado y publica oportunidades en blog

WORKSPACE="/Users/devjaime/.openclaw/workspace"
BLOG_DIR="$WORKSPACE/devjaimeblog"
TODAY=$(date +%Y-%m-%d)
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")
LOG_DIR="$WORKSPACE/scripts/logs"
LOG_FILE="$LOG_DIR/radar-oportunidades.log"

mkdir -p "$LOG_DIR"

log() {
    echo "[$TIMESTAMP] $1" | tee -a "$LOG_FILE"
}

log "🚀 Iniciando Radar de Oportunidades Tech/IA..."

# ============================================
# INTERESES DE JAIME
# ============================================

INTERESES=(
    "LangChain"
    "LangGraph"
    "CrewAI"
    "Ollama"
    "Open Source LLM"
    "AI Agent"
    "n8n"
    "Backend Go"
    "PostgreSQL"
    "AI Startup"
    "AI Latinoamerica"
)

# ============================================
# BÚSQUEDA DE NOTICIAS
# ============================================

NEWS_FILE="$LOG_DIR/news_tmp.txt"
SEARCH_TERMS="AI+OR+LangChain+OR+openai+OR+LLM+OR+startup"

# Intentar obtener noticias (método simple)
curl -s -m 10 "https://news.google.com/rss/search?q=${SEARCH_TERMS}&hl=en-US&gl=US&ceid=US:en" > "$NEWS_FILE" 2>/dev/null || true

# ============================================
# ANÁLISIS DE PATRONES
# ============================================

OPPORTUNITY_FOUND=0
TITLES_FOUND=""

# Extraer títulos de noticias
if [ -f "$NEWS_FILE" ]; then
    TITLES=$(grep -o '<title>[^<]*</title>' "$NEWS_FILE" | sed 's/<title>//g;s/<\/title>//g' | head -15)
fi

# ============================================
# EVALUAR OPORTUNIDADES
# ============================================

OPORTUNIDADES=""

for term in "${INTERESES[@]}"; do
    if echo "$TITLES" | grep -iq "$term"; then
        OPPORTUNITY_FOUND=1
        OPORTUNIDADES="${OPORTUNIDADES}- $term\n"
        log "✅ Oportunidad: $term"
    fi
done

# ============================================
# GENERAR ARTÍCULO SI HAY OPORTUNIDAD
# ============================================

if [ $OPPORTUNITY_FOUND -eq 1 ]; then
    log "📝 Generando artículo para blog..."
    
    ARTICLE_CONTENT="---
layout: \"../../layouts/BlogLayout.astro\"
title: \"Radar de Oportunidades - $TODAY\"
description: \"Análisis de oportunidades detectadas en el ecosistema AI/Tech para $(date +%B)\"
tags: [\"oportunidad\", \"AI\", \"radar\", \"mercado\"]
time: 5
featured: false
timestamp: \"$TODAY\"
filename: \"$TODAY-radar-oportunidades\"
---

# 🎯 Radar de Oportunidades - $TODAY

*Artículo generado automáticamente por sistema de monitoreo*

---

## 📰 Noticias Relevantes Detectadas

$(echo -e "$OPORTUNIDADES")

### Detalle de Títulos

\`\`\`
$TITLES
\`\`\`

---

## 🎯 Oportunidades para Ja

Conceptos detectados que hacen match con proyectos:

$(for term in "${INTERESES[@]}"; do
    if echo "$TITLES" | grep -iq "$term"; then
        echo "### $term"
        echo "- Revisar integración con proyectos existentes"
        echo "- Evaluar como feature para **Vocari.cl**"
        echo "- Considerar para **Orienta-AI**"
        echo ""
    fi
done)

---

## 📊 Análisis de Mercado

### Tendencias observadas:

$(echo "$TITLES" | head -5 | while read line; do
    echo "- $line"
done)

---

## ⚡ Próximos Pasos Recomendados

1. Investigar más sobre los conceptos detectados
2. Evaluar viabilidad técnica para proyectos existentes
3. Priorizar según impacto y esfuerzo

---

*🤖 Generado automáticamente | $TIMESTAMP*
"

    ARTICLE_FILE="$BLOG_DIR/src/pages/blog/$TODAY-radar-oportunidades.md"
    echo "$ARTICLE_CONTENT" > "$ARTICLE_FILE"
    log "✅ Artículo guardado: $ARTICLE_FILE"
    
    # Commit y push
    cd "$BLOG_DIR"
    git add "$ARTICLE_FILE" 2>/dev/null
    git commit -m "feat: radar oportunidades $TODAY" 2>/dev/null
    git push origin main 2>/dev/null || log "⚠️ No se pudo hacer push"
    
    # Alerta Alexa
    "$WORKSPACE/projects/homeassistant/alexa.sh" send "Jaime, encontré oportunidades de inteligencia artificial. Revisa tu blog para más detalles." 2>/dev/null || true
    log "✅ Alerta enviada a Alexa"
    
else
    log "ℹ️ No se encontraron oportunidades específicas para proyectos de Jaime hoy"
fi

# Limpiar
rm -f "$NEWS_FILE"

log "🏁 Radar de Oportunidades completado"
