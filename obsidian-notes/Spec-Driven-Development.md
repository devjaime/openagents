# Spec-Driven Development (SDD)

> Paradigma donde la especificación se convierte en la fuente de verdad, no el código.

## Concepto Central

**Enfoque tradicional:**
```
PRD → Diseño → Código → Testing
```
El código es la "verdad final".

**Spec-Driven Development:**
```
Especificación (ejecutable) → Plan de implementación → Código
```
La especificación genera el código.

## ¿Por Qué Ahora?

Tres tendencias hacen SDD necesario:

1. **IA ha alcanzado un umbral** - Especificaciones en lenguaje natural pueden generar código funcional
2. **Complejidad creciente** - Mantener sistemas alineados manualmente es insostenible
3. **Ritmo de cambio** - Los pivots son esperados, no excepcionales

## Herramientas Principales

### Comparativa

| Aspecto | [[OpenSpec]] | [[spec-kit]] |
|---------|--------------|--------------|
| **Enfoque** | Spec-deltas | Flujo completo SDD |
| **CLI** | ❌ No tiene | ✅ specify CLI |
| **Generación código** | ❌ Manual | ✅ Automática |
| **Integración AI** | ❌ No nativa | ✅ 20+ agents |
| **Curva aprendizaje** | Baja | Media |
| **Flexibilidad** | Alta | Media |

### ¿Cuál Elegir?

| Situación | Recomendación |
|-----------|---------------|
| MVP / Proyectos personales | [[spec-kit]] |
| Proyectos empresariales | Híbrido (ambos) |
| AI agents existentes | [[spec-kit]] |
| Requisitos estables | [[OpenSpec]] |

## Principios Clave

1. **Specs como Lingua Franca** - La especificación es el artefacto primario
2. **Specs Ejecutables** - Precisos, completos, no ambiguos
3. **Refinamiento Continuo** - Validación no es un gate único
4. **Feedback Bidireccional** - Realidad de producción informa specs
5. **Soberanía del Creador** - IA como copiloto, no piloto

## Beneficios

- ✅ Eliminación del gap especificación ↔ implementación
- ✅ Code reviews más fáciles con spec-deltas
- ✅ Cambios sistemáticos, no rewrites manuales
- ✅ Documentación automática
- ✅ Rápida iteración y prototipado

## Desafíos

- ❌ Requiere cambio cultural en el equipo
- ❌ Especificaciones deben ser muy precisas
- ❌ Curva de aprendizaje inicial
- ❌ Dependencia de tools/AI agents

## Empresas Usando SDD

- **GitHub** - spec-kit internamente
- **Microsoft** - Copilot Studio, Azure AI Studio
- **Anthropic** - Claude Code integración
- **Linear** - Specs como fuente de verdad
- **Vercel** - Next.js app dir
- **Supabase** - Specifications para APIs

## Flujo de Trabajo Típico

```
1. Idea vaga
   ↓
2. Especificación (describe el QUÉ)
   ↓
3. Plan técnico (define el CÓMO)
   ↓
4. Tareas ejecutables
   ↓
5. Implementación
   ↓
6. Testing (desde la spec)
   ↓
7. Producción
   ↓
8. Feedback → Actualizar spec
```

## Recursos

- [OpenSpec](https://openspec.dev)
- [spec-kit](https://github.com/github/spec-kit)
- [Spec-Driven Development Guide](https://github.com/github/spec-kit/blob/main/spec-driven.md)

---

**Tags:** #spec-driven-development #methodology #ai-development #software-architecture
**Relacionado:** [[OpenSpec]], [[spec-kit]], [[AI Development]]
