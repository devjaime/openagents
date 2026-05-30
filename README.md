# OpenAgents

Personal workspace for AI agents, automation scripts, memory, research notes, and prototype applications.

OpenAgents is not a single app. It is a versioned operating space for building and coordinating agent-driven projects while keeping local secrets, runtime state, media captures, logs, databases, and nested repositories out of the public root repository.

## English

### What This Repository Contains

- Agent operating documents: `AGENTS.md`, `SOUL.md`, `USER.md`, `MEMORY.md`, `TOOLS.md`.
- Project state and research notes: `ESTADO_REAL.md`, `ESTADO_FUNCIONAL.md`, `TECH_ANALYSIS_*.md`, `youtube-research/`, `obsidian-notes/`.
- Prototype projects tracked at the root: `ai-portfolio/`, `devjaime-portfolio/`, `aispec-quality/`, `memory-agent/`.
- Automation scripts: `scripts/`, `set_alarm.sh`.
- Spec Driven Development documentation: `specs/`.

### Spec Driven Development

This repository now uses a lightweight SDD structure inspired by GitHub spec-kit:

```text
specs/
  constitution.md
  001-openagents-workspace/
    spec.md
    plan.md
    data-model.md
    quickstart.md
    tasks.md
    contracts/
      repository-contract.md
```

Use this lifecycle for substantial changes:

```text
specify -> plan -> tasks -> implement -> validate
```

Start with `specs/constitution.md`, then add a numbered folder for each new workflow, automation, or product initiative.

### Repository Boundary

The root repository is designed to be public and reproducible. The `.gitignore` excludes:

- Environment files and secrets: `.env`, `.env.*`, `secrets.env`, private keys.
- Dependencies and build output: `node_modules/`, `.next/`, `dist/`, `build/`, caches.
- Runtime artifacts: logs, databases, archives, media captures, local OpenClaw state.
- Nested repositories managed independently, including `arrienda/`, `app-entrenamiento-ia/`, `devjaimeblog/`, `humanloop/`, `orienta-ai/`, and `projects/`.

### Quick Start

```bash
git clone https://github.com/devjaime/openagents.git
cd openagents
find specs -maxdepth 3 -type f | sort
```

Before committing changes:

```bash
git status --short --branch
git diff --cached --name-only
git diff --cached --stat
```

Review staged files before pushing. Do not commit real credentials, private runtime files, local databases, generated dependencies, or nested Git repositories.

### Current Documentation Entry Points

- `specs/constitution.md`: durable principles for this workspace.
- `specs/001-openagents-workspace/spec.md`: requirements and user scenarios.
- `specs/001-openagents-workspace/plan.md`: implementation plan and repository boundaries.
- `specs/001-openagents-workspace/quickstart.md`: validation workflow.
- `specs/001-openagents-workspace/contracts/repository-contract.md`: safety contract for public commits.

---

## Español

### Qué Contiene Este Repositorio

OpenAgents es un workspace personal para agentes de IA, automatizaciones, memoria, investigación y prototipos. No es una sola aplicación: es una base versionada para coordinar proyectos asistidos por agentes sin publicar secretos ni estado local sensible.

Incluye:

- Documentos operativos para agentes: `AGENTS.md`, `SOUL.md`, `USER.md`, `MEMORY.md`, `TOOLS.md`.
- Estado de proyectos e investigación: `ESTADO_REAL.md`, `ESTADO_FUNCIONAL.md`, `TECH_ANALYSIS_*.md`, `youtube-research/`, `obsidian-notes/`.
- Prototipos versionados en el repo raíz: `ai-portfolio/`, `devjaime-portfolio/`, `aispec-quality/`, `memory-agent/`.
- Scripts de automatización: `scripts/`, `set_alarm.sh`.
- Documentación de Spec Driven Development: `specs/`.

### Spec Driven Development

El repositorio usa una estructura liviana de SDD inspirada en GitHub spec-kit:

```text
specs/
  constitution.md
  001-openagents-workspace/
    spec.md
    plan.md
    data-model.md
    quickstart.md
    tasks.md
    contracts/
      repository-contract.md
```

Para cambios importantes, usa este flujo:

```text
specify -> plan -> tasks -> implement -> validate
```

Parte leyendo `specs/constitution.md`. Para cada nuevo flujo, automatización o producto, crea una carpeta numerada dentro de `specs/`.

### Límite Público/Privado

El repositorio raíz está preparado para ser público y reproducible. El `.gitignore` excluye:

- Archivos de entorno y secretos: `.env`, `.env.*`, `secrets.env`, llaves privadas.
- Dependencias y builds: `node_modules/`, `.next/`, `dist/`, `build/`, caches.
- Artefactos locales: logs, bases de datos, archivos comprimidos, capturas de media, estado local de OpenClaw.
- Repositorios anidados que se manejan por separado, como `arrienda/`, `app-entrenamiento-ia/`, `devjaimeblog/`, `humanloop/`, `orienta-ai/` y `projects/`.

### Inicio Rápido

```bash
git clone https://github.com/devjaime/openagents.git
cd openagents
find specs -maxdepth 3 -type f | sort
```

Antes de commitear:

```bash
git status --short --branch
git diff --cached --name-only
git diff --cached --stat
```

Revisa los archivos staged antes de subirlos. No publiques credenciales reales, archivos privados de runtime, bases de datos locales, dependencias generadas ni repositorios Git anidados.

### Entradas Principales de Documentación

- `specs/constitution.md`: principios durables del workspace.
- `specs/001-openagents-workspace/spec.md`: requisitos y escenarios de usuario.
- `specs/001-openagents-workspace/plan.md`: plan de implementación y límites del repo.
- `specs/001-openagents-workspace/quickstart.md`: flujo de validación.
- `specs/001-openagents-workspace/contracts/repository-contract.md`: contrato de seguridad para commits públicos.
