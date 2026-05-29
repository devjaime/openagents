#!/bin/bash
# Radar Inmobiliario - Coquimbo + Segunda Propiedad
# Monitoreo silencioso de inversiones inmobiliarias

WORKSPACE="/Users/devjaime/.openclaw/workspace"
TODAY=$(date +%Y-%m-%d)
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")
LOG_DIR="$WORKSPACE/scripts/logs/inmobiliario"
UF_HISTORY_FILE="$LOG_DIR/uf_history.csv"
ALERTS_FILE="$LOG_DIR/alertas.md"
REPORT_FILE="$LOG_DIR/resumen_$TODAY.md"

mkdir -p "$LOG_DIR"

log() {
    echo "[$TIMESTAMP] [INMOBILIARIO] $1"
}

# ============================================
# CONFIGURACIÓN PROPIEDADES
# ============================================

# Casa Coquimbo
PROP_NOMBRE="Casa Coquimbo - Altos del Mirador"
PRECIO_COMPRA_UF=2400
VALOR_ACTUAL_UF=3500
ARRIENDO_MENSUAL_CLP=500000
FECHA_INICIO_ARRIENDO="2025-12-01"
MESES_ARRENDADA=4
CONTRATO_ANIOS=25
DIVIDENDOS_PAGADOS=4
UF_HOY=38500

# ============================================
# CÁLCULOS
# ============================================

# Plusvalía
PLUSVALIA_PCT=$(( (VALOR_ACTUAL_UF - PRECIO_COMPRA_UF) * 100 / PRECIO_COMPRA_UF ))
PLUSVALIA_MES=$(( (VALOR_ACTUAL_UF - PRECIO_COMPRA_UF) / MESES_ARRENDADA ))

# Valor en CLP
VALOR_CLP=$(( VALOR_ACTUAL_UF * UF_HOY ))

# Rentabilidad bruta anual
RENTABILIDAD=$(awk "BEGIN {printf \"%.2f\", (${ARRIENDO_MENSUAL_CLP} * 12) / (${VALOR_ACTUAL_UF} * ${UF_HOY}) * 100}")

# Dividendos restantes
DIVIDENDOS_TOTALES=$(( CONTRATO_ANIOS * 12 ))
DIVIDENDOS_RESTANTES=$(( DIVIDENDOS_TOTALES - DIVIDENDOS_PAGADOS ))
ANOS_RESTANTES=$(( DIVIDENDOS_RESTANTES / 12 ))

# Nuevo arriendo (4% anual si ha pasado un año)
NUEVO_ARRIENDO=$ARRIENDO_MENSUAL_CLP
if [ $MESES_ARRENDADA -ge 12 ]; then
    NUEVO_ARRIENDO=$(( ARRIENDO_MENSUAL_CLP * 104 / 100 ))
fi

# Proximo aumento arriendo
if [ $MESES_ARRENDADA -lt 12 ]; then
    MESES_FALTA=$(( 12 - MESES_ARRENDADA ))
    PROXIMO_AUMENTO_ARRENDO="$MESES_FALTA meses"
else
    PROXIMO_AUMENTO_ARRENDO="Enero 2027"
fi

log "📊 Analizando propiedad Coquimbo..."

# ============================================
# GENERAR REPORTE
# ============================================

cat > "$REPORT_FILE" << EOF
# 📊 Reporte Inmobiliario - $TODAY

*Generado automáticamente | Última actualización: $TIMESTAMP*

---

## 🏠 $PROP_NOMBRE

### Valorización

| Métrica | Valor |
|---------|-------|
| Precio compra | ${PRECIO_COMPRA_UF} UF |
| Valor actual | ${VALOR_ACTUAL_UF} UF |
| Plusvalía total | +${PLUSVALIA_PCT}% |
| Plusvalía mensual | ~${PLUSVALIA_MES} UF/mes |
| Valor en CLP (UF $UF_HOY) | \$$(printf "%'d" $VALOR_CLP) CLP |

### Arriendo

| Métrica | Valor |
|---------|-------|
| Arriendo actual | \$$(printf "%'d" $ARRIENDO_MENSUAL_CLP) CLP/mes |
| Rentabilidad bruta | ${RENTABILIDAD}% anual |
| Meses arrendada | ${MESES_ARRENDADA} |
| Próxima subida | ${PROXIMO_AUMENTO_ARRENDO} |
| Nuevo arriendo sugerido | \$$(printf "%'d" $NUEVO_ARRIENDO) CLP |

### Crédito Hipotecario

| Métrica | Valor |
|---------|-------|
| Dividendos pagados | ${DIVIDENDOS_PAGADOS} / ${DIVIDENDOS_TOTALES} |
| Dividendos restantes | ${DIVIDENDOS_RESTANTES} |
| Años restantes | ~${ANOS_RESTANTES} años |

---

## 🔧 Mantenciones Programadas

| Tarea | Frecuencia | Última | Próxima |
|-------|------------|--------|---------|
| Revisión techumbre | Anual | 2025-06 | 2026-06 |
| Mantención calefacción | Anual | 2025-04 | 2026-04 |
| Limpieza alcantarillado | Bianual | 2025-01 | 2027-01 |
| Revisión extintores | Anual | 2025-12 | 2026-12 |
| Pintura exterior | 3 años | 2024-01 | 2027-01 |

---

## 📅 Timeline 2026

| Mes | Evento |
|-----|--------|
| Abril | Revisión mercado arriendo actual |
| Junio | Mantención techumbre |
| Diciembre | Aumento arriendo a \$$(printf "%'d" $NUEVO_ARRIENDO) CLP |

---

## 🎯 Targets

| Meta | target | Status |
|------|--------|--------|
| Segunda propiedad | 2028-2029 | En progreso |
| 100% dividendo prepago | 2048 | Lejos |
| Plusvalía 100% | 2030 | En camino (+${PLUSVALIA_PCT}% actual) |

---

*Reporte guardado en: $LOG_DIR*
EOF

log "✅ Reporte generado"

# ============================================
# HISTORIAL UF
# ============================================

# Guardar UF actual
echo "$TODAY,$UF_HOY" >> "$UF_HISTORY_FILE"

# ============================================
# ALERTAS
# ============================================

ALERTAS_NUEVAS=""

# Verificar si corresponde aumento de arriendo
if [ $MESES_ARRENDADA -ge 12 ]; then
    ALERTAS_NUEVAS="${ALERTAS_NUEVAS}📢 CORRESPONDE SUBIR ARRIENDO a \$$(printf "%'d" $NUEVO_ARRIENDO) CLP\n"
fi

if [ -n "$ALERTAS_NUEVAS" ]; then
    echo -e "## 🚨 Alertas - $TODAY\n\n$ALERTAS_NUEVAS\n" >> "$ALERTS_FILE"
    log "⚠️ Alertas guardadas"
fi

# ============================================
# RESUMEN
# ============================================

echo ""
echo "=== 📊 RESUMEN INMOBILIARIO $TODAY ==="
echo "Plusvalía: +${PLUSVALIA_PCT}% (${PLUSVALIA_MES} UF/mes)"
echo "Rentabilidad: ${RENTABILIDAD}% anual"
echo "Valor: \$$(printf "%'d" $VALOR_CLP) CLP"
echo "Próxima subida arriendo: ${PROXIMO_AUMENTO_ARRENDO}"
echo "Dividendos restantes: ${DIVIDENDOS_RESTANTES} (~${ANOS_RESTANTES} años)"
echo "==========================="
