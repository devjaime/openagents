#!/bin/bash
# Radar SEO IA Agents - Genera artículos sobre tendencias de IA Agéntica
# Ejecuta diariamente para mantener el blog actualizado y mejorar SEO

WORKSPACE="/Users/devjaime/.openclaw/workspace"
BLOG_DIR="$WORKSPACE/devjaimeblog"
TODAY=$(date +%Y-%m-%d)
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")
LOG_DIR="$WORKSPACE/scripts/logs"
LOG_FILE="$LOG_DIR/radar-agents.log"

mkdir -p "$LOG_DIR"

log() {
    echo "[$TIMESTAMP] [AGENTS] $1" | tee -a "$LOG_FILE"
}

log "🚀 Iniciando Radar SEO IA Agents..."

# ============================================
# TEMAS DE IA AGENTS PARA CUBRIR
# ============================================

TEMAS=(
    "LangChain"
    "LangGraph"
    "CrewAI"
    "MCP Model Context Protocol"
    "AI Agents"
    "Autonomous AI"
    "RAG Systems"
    "Multi-Agent"
    "n8n"
    "Ollama"
    "Vector Database"
)

# ============================================
# BÚSQUEDA DE TENDENCIAS
# ============================================

# RSS feeds de fuentes confiables
FEEDS=(
    "https://news.google.com/rss/search?q=AI+agents+LangChain+LangGraph&hl=en-US&gl=US&ceid=US:en"
    "https://news.google.com/rss/search?q=autonomous+AI+agents&hl=en-US&gl=US&ceid=US:en"
)

TEMAS_ACTUALES=""
NEWS_FILE="$LOG_DIR/news_agents_$TODAY.txt"

for feed in "${FEEDS[@]}"; do
    curl -s -m 10 "$feed" >> "$NEWS_FILE" 2>/dev/null || true
done

# Extraer títulos
if [ -f "$NEWS_FILE" ]; then
    TITULOS=$(grep -o '<title>[^<]*</title>' "$NEWS_FILE" 2>/dev/null | sed 's/<title>//g;s/<\/title>//g' | head -20)
fi

# ============================================
# SELECCIONAR TEMA DEL DÍA
# ============================================

TEMA_ELEGIDO=""
for tema in "${TEMAS[@]}"; do
    if echo "$TITULOS" | grep -iq "$tema"; then
        TEMA_ELEGIDO="$tema"
        break
    fi
done

# Si no hay match, usar tema rotativo basado en día
if [ -z "$TEMA_ELEGIDO" ]; then
    DIASEMANA=$(date +%u)
    INDEX=$((DIASEMANA % ${#TEMAS[@]}))
    TEMA_ELEGIDO="${TEMAS[$INDEX]}"
fi

log "📌 Tema elegido: $TEMA_ELEGIDO"

# ============================================
# GENERAR ARTÍCULO SEO
# ============================================

# Contenido según tema
case "$TEMA_ELEGIDO" in
    "LangChain"|"LangGraph")
        TITULO="Guía Completa de $TEMA_ELEGIDO para AI Agents en Producción"
        DESCRIPCION="Aprende cómo implementar $TEMA_ELEGIDO para construir sistemas de IA agéntica robustos y escalables. Desde conceptos básicos hasta ejemplos de producción."
        ;;
    "CrewAI")
        TITULO="CrewAI: Orquestación Multi-Agente Simplificada"
        DESCRIPCION="Descubre cómo CrewAI facilita la creación de sistemas multi-agente donde diferentes roles colaboran para完成任务. Tutorial práctico con ejemplos."
        ;;
    "MCP Model Context Protocol")
        TITULO="MCP (Model Context Protocol): El Estándar para Conectar AI Agents con Herramientas"
        DESCRIPCION="Todo lo que necesitas saber sobre MCP, el protocolo que está revolucionando cómo los agentes IA interactúan con APIs, bases de datos y servicios externos."
        ;;
    "RAG Systems")
        TITULO="Sistemas RAG para AI Agents: Retrieval Augment Generation en Producción"
        DESCRIPCION="Implementa RAG systems que permiten a tus agentes acceder a conocimiento actualizado y relevante. Arquitectura, mejores prácticas y ejemplos con pgvector."
        ;;
    "AI Agents"|"Autonomous AI")
        TITULO="AI Agents Autónomos: De Teoría a Producción"
        DESCRIPCION="Una introducción práctica a los sistemas de IA agéntica, cómo funcionan, casos de uso reales y cómo implementar tu primer agente autónomo."
        ;;
    *)
        TITULO="Tendencias en AI Agents: $TEMA_ELEGIDO en 2026"
        DESCRIPCION="Análisis de las últimas novedades en $TEMA_ELEGIDO y su aplicación en sistemas de IA agéntica para empresas y startups."
        ;;
esac

# Noticias relacionadas
NOTICIAS_RELACIONADAS=$(echo "$TITULOS" | head -5 | while read t; do echo "- $t"; done)

ARTICLE_CONTENT="---
layout: \"../../layouts/BlogLayout.astro\"
title: \"$TITULO\"
description: \"$DESCRIPCION\"
tags: [\"AI Agents\", \"$TEMA_ELEGIDO\", \"LangChain\", \"automatización\", \"IA\"]
time: 10
featured: false
timestamp: \"$TODAY\"
filename: \"$TODAY-$TEMA_ELEGIDO-guia\"
---

# $TITULO

*Artículo generado automáticamente | Tendencias actualizadas: $TODAY*

---

## ¿Por qué $TEMA_ELEGIDO importa?

$TEMA_ELEGIDO se ha convertido en una tecnología clave para construir sistemas de inteligencia artificial agéntica. En este artículo exploramos los fundamentos, casos de uso y cómo implementarlo en tus proyectos.

---

## Estado del Arte

El ecosistema de AI Agents está evolucionando rápidamente:

- **LangChain/LangGraph**: Framework estándar para construir agentes con estado y memoria
- **CrewAI**: Simplifica la orquestación de múltiples agentes con roles definidos  
- **MCP**: Protocolo emergente para conectar agentes con herramientas externas
- **RAG**: Retrieval Augmented Generation para dar contexto a los agentes

---

## Casos de Uso Principales

### 1. Automatización de Procesos Empresariales

Los AI agents pueden ejecutar tareas repetitivas de manera autónoma:
- Procesamiento de documentos
- Atención al cliente 24/7
- Análisis de datos complejos

### 2. Sistemas Multi-Agente

Múltiples agentes especializados colaboran:
- Un agente pesquisa información
- Otro analiza y sintetiza
- Un tercero genera reportes

### 3. RAG para Conocimiento Actualizado

Agentes con acceso a bases de conocimiento:
- Documentación técnica
- Políticas empresariales
- Información de productos

---

## Implementación con LangChain/LangGraph

\`\`\`python
from langgraph.graph import StateGraph
from langchain_core.messages import HumanMessage

# Definir estado del agente
class AgentState:
    messages: list

# Crear grafo
graph = StateGraph(AgentState)

# Agregar nodos
graph.add_node(\"agent\", agent_node)
graph.add_node(\"action\", action_node)

# Compilar
app = graph.compile()
\`\`\`

---

## $TEMA_ELEGIDO en el Contexto Latinoamericano

En Chile y Latinoamérica, la adopción de AI Agents está creciendo:

- **Empresas de retail** automatizando inventarios y logística
- **Startups** construyendo MVPs con agentes autónomos
- **Desarrolladores** aprendiendo herramientas como LangChain y CrewAI

---

## Cómo Puedo Ayudar

Soy **Jaime Hernández**, AI Agents Engineer con experiencia en:

- Implementación de LangChain, LangGraph y CrewAI
- Diseño de arquitecturas multi-agente
- Sistemas RAG con PostgreSQL/pgvector
- Integración MCP para conectar agentes con APIs

**¿Tienes un proyecto en mente?** Conversemos cómo la IA agéntica puede transformar tu negocio.

👉 [LinkedIn](https://www.linkedin.com/in/devjaime/) | [GitHub](https://github.com/devjaime/)

---

## Recursos

- [LangChain Documentation](https://python.langchain.com/)
- [LangGraph](https://langchain-ai.github.io/langgraph/)
- [CrewAI](https://crewai.com/)
- [MCP Specification](https://modelcontextprotocol.io/)

---

## Búsquedas Relacionadas

- ingeniero IA agéntica Chile
- experto LangChain Latinoamerica
- AI agents developer
- RAG system implementation
- MCP Model Context Protocol

---

*🤖 Generado automáticamente | $TIMESTAMP*
"

# Guardar artículo
ARTICLE_FILE="$BLOG_DIR/src/pages/blog/$TODAY-$TEMA_ELEGIDO-guia.md"
echo "$ARTICLE_CONTENT" > "$ARTICLE_FILE"
log "✅ Artículo guardado: $ARTICLE_FILE"

# Commit y push
cd "$BLOG_DIR"
git add "$ARTICLE_FILE" 2>/dev/null
git commit -m "feat: Radar SEO IA Agents - $TEMA_ELEGIDO ($TODAY)" 2>/dev/null
git push origin main 2>/dev/null || log "⚠️ No se pudo hacer push"

# Limpiar
rm -f "$NEWS_FILE"

# Notificar
"$WORKSPACE/projects/homeassistant/alexa.sh" send "Jaime, publiqué nuevo artículo sobre $TEMA_ELEGIDO en tu blog. SEO actualizado." 2>/dev/null || true

log "🏁 Radar SEO IA Agents completado"
