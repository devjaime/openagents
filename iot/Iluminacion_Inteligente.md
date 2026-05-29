# Iluminación Inteligente

## Dispositivos

| Dispositivo | Costo (USD) | Marca Recomendada | Protocolo |
|-------------|-------------|-------------------|-----------|
| Bombilla LED Smart | $10-25 | TP-Link Kasa, Philips Hue | WiFi/Zigbee |
| Strip LED | $15-50 | Govee, Nanoleaf | WiFi |
| Interruptor Smart | $15-30 | Sonoff, TP-Link | WiFi/Zigbee |
| Regulador | $10-20 | Lutron, Philips | WiFi |

## Valor de Automatización

### ★★☆☆☆ (Medio)
- **Ahorro energético:** 10-20% (programación)
- **Conveniencia:** Alta (voz, horarios)
- **Comodidad:** Media

## Automatizaciones con IA

```yaml
# Ejemplo: Iluminación adaptativa
triggers:
  - sunrise/sunset
  - occupancy (movimiento)
actions:
  - Ajustar temperatura color según hora
  - Simular presencia (ausencia)
  - Alertas visuales (notificaciones)
```

## Casa Coquimbo

### Prioridad: Baja
- **Razón:** Casa arrendada, foco en seguridad
- **Recomendación:** Solo interruptores smart si hay acceso

---

*Relacionado: [[IoT_Domestico_Indice]] | [[Climatizacion]] | [[Seguridad]]*
