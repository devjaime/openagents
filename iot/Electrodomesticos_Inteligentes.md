# Electrodomésticos Inteligentes

## Dispositivos

| Dispositivo | Costo (USD) | Marca Recomendada | Protocolo |
|-------------|-------------|-------------------|-----------|
| Enchufe Smart | $10-20 | TP-Link Kasa, Sonoff | WiFi |
| Foco LED | $15-30 | Philips Hue, LIFX | WiFi |
| Aspiradora Robot | $150-600 | Roborock, Roomba, Xiaomi | WiFi |
| Lavadora/Secadora | $400-1000 | LG, Samsung | WiFi |
| Horno/Sartén | $100-300 | Anova, Instant Pot | WiFi/Bluetooth |
| Cafetera | $50-150 | Philips, Ninja | WiFi |
| Refrigerador | $500-2000 | Samsung, LG | WiFi |

## Valor de Automatización

### ★★☆☆☆ (Medio)
- **Ahorro energético:** 10-15%
- **Conveniencia:** Alta (encendido remoto)
- **Tiempo:** Alto (menos tareas manuales)

## Automatizaciones con IA

```yaml
# Ejemplo: Rutina doméstica
triggers:
  - hora (despertar, salida trabajo)
  - ubicación (geofencing)
actions:
  - Encender cafetera 7am
  - Iniciar lavadora (tarifa reducida)
  - Apagar standby equipos
  - Aspiradora robot cuando no hay nadie
```

## Casa Coquimbo

### Prioridad: ★★☆☆☆
- **Razón:** Gestión remota no crítica
- **Recomendación:** 
  - Enchufes smart para control remoto
  - Aspiradora robot (si hay internet estable)
- **Costo beneficio:** Bajo para propiedad arrendada

---

*Relacionado: [[IoT_Domestico_Indice]] | [[Seguridad]] | [[Iluminacion_Inteligente]]*
