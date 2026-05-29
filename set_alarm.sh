#!/bin/bash
# Configurar alarma en Alexa a las 8:30 AM

curl -s -X POST "http://127.0.0.1:8123/api/services/notify/alexa_media" \
  -H "Authorization: Bearer $HA_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{"message": "Alexa, pon una alarma a las ocho y media de la mañana", "target": ["media_player.echo_dot_de_jaime"]}'
