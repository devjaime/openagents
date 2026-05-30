# OpenAgents Constitution

## Purpose

OpenAgents is a personal agent workspace for coordinating AI assistants, memory, automation scripts, research notes, and prototype applications. The repository must remain useful as a reproducible public index without exposing local secrets, private runtime state, or generated artifacts.

## Principles

### 1. Public by Default, Private by Design

Any committed file must be safe to publish. Secrets, local credentials, private media captures, runtime logs, databases, and machine-specific state belong outside Git or in ignored paths.

### 2. Memory Is Versioned Intentionally

Agent memory and project context may be versioned when they describe reusable decisions, conventions, or project state. Raw sensitive context should stay local.

### 3. Specs Before Expansion

New substantial workflows, automations, or prototype apps should begin with a spec that defines the outcome, acceptance criteria, data touched, and operational risks before implementation.

### 4. Nested Projects Stay Independent

Independent application repositories inside the workspace should keep their own Git history and deployment lifecycle. The OpenAgents root repository documents and indexes them; it should not silently absorb nested repos.

### 5. Reproducible Operations

Scripts should document required environment variables, expected inputs, outputs, and failure modes. Commands that touch external services should be explicit about side effects.

### 6. Human-Centered Agent Behavior

Agent instructions should prioritize usefulness, safety, continuity, and respect for the user context. The workspace should help agents act with context without leaking or over-sharing personal information.

## Governance

- Changes to these principles require a pull request or commit that explains why the rule changed.
- Specs under `specs/` are the source of truth for future changes to this repository.
- The root `README.md` must remain bilingual in English and Spanish.
