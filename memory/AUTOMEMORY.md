# Auto-Memory System

> Sistema de aprendizaje automático para记忆 persistente

## Cómo Funciona

1. **Detectar correcciones** - Cuando el usuario me corrige, tomarlo nota
2. **Capturar preferencias** - Cuando expresa preferencias, documentarlas
3. **Sintetizar al cerrar** - Generar resumen de aprendizajes de la sesión

##触发es para Auto-Memory

### Correcciones del Usuario
```
Usuario: "No, así no es - se hace así..."
→ Capturar: qué estaba mal, cómo corregirlo
```

### Preferencias Explícitas
```
Usuario: "Prefiero usar pnpm sobre npm"
→ Registrar en preferencias
```

### Decisiones Importantes
```
Usuario: "Vamos a usar PostgreSQL para este proyecto"
→ Guardar decisión + razón
```

## Cuándo Actualizar

### En Cada Sesión
- Al inicio: leer MEMORY.md + memory/hoy + memoria proyecto
- Al final: sintetizar aprendizajes nuevos

### En Heartbeats
- Revisar memory/ de días recientes
- Actualizar MEMORY.md con insights acumulados

## Formato de Entradas

```markdown
### 2026-03-09 - Corrección
- **Contexto:** Estaba haciendo X
- **Corrección:** El usuario corrigió que Y
- **Aprendizaje:** Ahora sé que Z

### 2026-03-09 - Preferencia
- **偏好:** Prefiere A sobre B
- **Contexto:** En proyectos de tipo C
```

## Ubicaciones

- **Aprendizajes recientes:** `memory/autolearn/`
- **Preferencias consolidadas:** `MEMORY.md`
- **Proyecto específico:** `{project}/.claude/CLAUDE.md`

---

*Sistema de auto-aprendizaje activo*
