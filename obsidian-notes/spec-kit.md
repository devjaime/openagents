# GitHub spec-kit

> Toolkit completo de Spec-Driven Development con generación automática de código

## Definición

spec-kit es un toolkit de código abierto de GitHub que automatiza el flujo completo de Spec-Driven Development. Incluye CLI con comandos especializados y soporte para múltiples AI agents.

**Repositorio:** https://github.com/github/spec-kit

## Flujo de Comandos

```
specify → plan → tasks → implement
```

### 1. `/speckit.constitution`

Crea principios rectores del proyecto:

```
/speckit.constitution Create principles focused on code quality, 
testing standards, user experience consistency, and performance requirements
```

### 2. `/speckit.specify`

Describe qué quieres construir (el qué, no el cómo):

```
/speckit.specify Build an application that can help me organize my photos 
in separate photo albums. Albums are grouped by date.
```

### 3. `/speckit.plan`

Proporciona stack tecnológico y decisiones arquitectónicas:

```
/speckit.plan The application uses Vite with vanilla HTML, CSS, JavaScript.
Images stored locally with metadata in SQLite.
```

### 4. `/speckit.tasks`

Genera lista de tareas ejecutables desde el plan.

### 5. `/speckit.implement`

Ejecuta todas las tareas y construye el feature.

## AI Agents Soportados

| Agent | Estado | Notas |
|-------|--------|-------|
| Claude Code | ✅ | Completamente soportado |
| Cursor | ✅ | IDE-based |
| Windsurf | ✅ | IDE-based |
| Codex CLI | ✅ | OpenAI |
| Gemini CLI | ✅ | Google |
| Qwen Code | ✅ | Alibaba |
| GitHub Copilot | ✅ | VS Code |
| +15 más | ✅ | Kiro, Amp, Roo, etc. |

## Instalación

```bash
# Instalación persistente (recomendado)
uv tool install specify-cli --from git+https://github.com/github/spec-kit.git

# O ejecutar directamente
uvx --from git+https://github.com/github/spec-kit.git specify init <PROJECT_NAME>
```

## Documentación Automática

spec-kit genera automáticamente:

- ✅ `plan.md` - Plan de implementación
- ✅ `data-model.md` - Modelos de datos
- ✅ `contracts/` - Contratos de API
- ✅ `quickstart.md` - Guía de validación
- ✅ `tasks.md` - Lista de tareas

## Comparativa de Tiempo

| Fase | Tradicional | spec-kit |
|------|-------------|----------|
| PRD | 2-3 horas | 5 min |
| Diseño | 2-3 horas | 5 min |
| Setup | 30 min | Automático |
| Specs técnicas | 3-4 horas | 5 min |
| Plan de tests | 2 horas | Incluido |
| **Total** | ~12 horas | **15 min** |

## Ventajas

| Ventaja | Descripción |
|---------|-------------|
| Flujo automatizado | specify → plan → tasks → implement |
| Multi-agent | Funciona con 20+ AI agents |
| Generación automática | Código, tests, docs desde spec |
| Constitución | Principios de proyecto versionables |
| Comunidad activa | GitHub respalda el proyecto |
| Documentación rica | Plan, modelos, contratos automáticos |

## Desventajas

- ❌ Curva de aprendizaje mayor
- ❌ Requiere AI agent configurado
- ❌ Más opinionado (menos flexible)
- ❌ Dependencia de herramientas específicas

## ¿Cuándo Usar?

- ✅ Nuevos proyectos desde cero
- ✅ Desarrollo asistido por AI
- ✅ Equipos que quieren automatizar el flujo completo
- ✅ Prototipado rápido
- ✅ Cuando necesitas generación automática de código

## Ejemplo de Flujo

```bash
# 1. Inicializar proyecto
specify init my-project --ai claude

# 2. Crear constitución
/speckit.constitution Create principles focused on code quality

# 3. Definir feature
/speckit.specify Real-time chat system with message history

# 4. Definir plan técnico
/speckit.plan PostgreSQL for history, Redis for presence, WebSocket

# 5. Generar tareas
/speckit.tasks

# 6. Implementar
/speckit.implement
```

## Demostraciones

- [.NET CLI tool (Greenfield)](https://github.com/mnriem/spec-kit-dotnet-cli-demo)
- [Spring Boot + React (Greenfield)](https://github.com/mnriem/spec-kit-spring-react-demo)
- [ASP.NET CMS extension (Brownfield)](https://github.com/mnriem/spec-kit-aspnet-brownfield-demo)

## Recursos

- **Repo:** https://github.com/github/spec-kit
- **Docs:** https://github.github.io/spec-kit/
- **Video:** https://www.youtube.com/watch?v=a9eR1xsfvHg

---

**Tags:** #spec-driven-development #ai-development #github #automation #toolkit
