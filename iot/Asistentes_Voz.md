# Asistentes de Voz

## Dispositivos

| Dispositivo | Costo (USD) | Marca | Compatibilidad |
|-------------|-------------|-------|----------------|
| Echo Dot | $40-50 | Alexa/Echo | Amplia |
| Echo Show | $80-150 | Alexa/Echo | Pantalla |
| Nest Mini | $50 | Google | Amplia |
| HomePod | $100-300 | Apple | HomeKit |
| Home Assistant Yellow | $90 | DIY | Todo |

## Valor de Automatización

### ★★★★★ (Muy Alto)
- **Centro de control:** Unifica todos los dispositivos
- **Voz:** Control manos libres
- **Rutinas:** Automatizaciones complejas
- **Notificaciones:** Audio en toda la casa

## Automatizaciones con IA

```yaml
# Ejemplo: Rutina matutina
triggers:
  - "Alexa, buenos días"
  - hora 7am
actions:
  - Decir clima y noticias
  - Encender luces
  - Dar resumen del día
  - Activar cafetera

# Ejemplo: Modo ausencia
triggers:
  - geofencing (todos salen)
actions:
  - Apagar luces
  - Termostato modo ahorro
  - Activar cámaras
  - Notificar estado
```

## Home Assistant

### ★★★★★
- **Alternativa local:** No зависи de cloud
- **Control total:** Automatizaciones infinitas
- **Costo:** $90 (Yellow) + tiempo configuración
- **Integración:** Todo (Zigbee, Z-Wave, WiFi, MQTT)

## Casa Coquimbo

### Prioridad: ★★★★★
- **Actual:** Alexa integrada con Home Assistant
- **Recomendación:** 
  - Mantener Alexa para notificaciones
  - Expandir con Home Assistant local
  - Añadir Echo Show para video

---

*Relacionado: [[IoT_Domestico_Indice]] | [[Seguridad]] | [[Climatizacion]] | [[Home_Automation]]*
