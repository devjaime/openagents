# OpenSpec

> Framework ligero para Spec-Driven Development centrado en spec-deltas

## Definición

OpenSpec es un framework minimalista que captura cambios en los requerimientos del sistema mediante **spec-deltas** - documentos que muestran exactamente qué cambió entre versiones.

## Características Principales

### 1. Spec Deltas

Cada cambio en requisitos se captura como diff legible:

```diff
### Requirement: Session expiration
- The system SHALL expire sessions after a configured duration.
+ The system SHALL support configurable session expiration periods.

#### Scenario: Default session timeout
- GIVEN a user has authenticated
- - WHEN 24 hours pass without activity
+ - WHEN 24 hours pass without "Remember me"
- THEN invalidate the session token
```

### 2. Sintaxis Gherkin-like

- **Given**: Precondiciones
- **When**: Acciones  
- **Then**: Resultados esperados

### 3. Enfoque Minimalista

- Sin CLI compleja
- Se centra en el documento de especificación
- Compatible con cualquier workflow

## Ventajas

| Ventaja | Descripción |
|---------|-------------|
| Ligero | Sin CLI, focus en documentos |
| Diff claro | Facilita code reviews |
| Flexible | Se adapta a cualquier workflow |
| Minimal learning curve | Sintaxis familiar (Gherkin) |
| Versionable | Changes fáciles de seguir |

## Desventajas

- ❌ No tiene generación automática de código
- ❌ Requiere más trabajo manual
- ❌ Menor integración con AI agents
- ❌ Comunidad más pequeña

## ¿Cuándo Usar?

- ✅ Proyectos donde las specs ya están bien definidas
- ✅ Equipos que prefieren control manual
- ✅ Cuando necesitas spec-deltas claros para reviews
- ✅ Flujos existentes que no quieres cambiar
- ✅ Proyectos con requerimientos muy estables

## Ejemplo de Uso

```
Feature: User Authentication

### Requirement: Login
- The system SHALL allow users to authenticate with email and password

#### Scenario: Successful login
- GIVEN a registered user exists
- WHEN the user submits valid credentials
- THEN the user SHALL be granted access
- AND a session token SHALL be returned
```

## Recursos

- **Sitio web:** https://openspec.dev
- **Documentación:** https://openspec.dev/docs

---

**Tags:** #spec-driven-development #requirements #specification #open-spec
