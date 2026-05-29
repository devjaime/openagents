# Memory Agent

Servicio para mantener continuidad de conversaciones entre sesiones.

## Estructura

```
memory-agent/
├── src/
│   ├── main.go
│   ├── handlers.go
│   ├── embeddings.go
│   └── config.go
├── db/
│   └── schema.sql
├── .env.example
└── README.md
```

## API

- `POST /save` - Guardar mensaje
- `GET /search?q=...` - Buscar conversaciones
- `GET /session/{id}` - Historial de sesión

## TODO

- [ ] Schema SQL
- [ ] Handlers Go
- [ ] Integración con Supabase
- [ ] Tests