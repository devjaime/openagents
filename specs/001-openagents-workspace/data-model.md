# Data Model: OpenAgents Workspace

## Entity: Workspace

Represents the root repository.

| Field | Description |
| --- | --- |
| `name` | `openagents` |
| `root` | `/Users/devjaime/.openclaw/workspace` locally |
| `remote` | `https://github.com/devjaime/openagents.git` |
| `default_branch` | `main` |
| `visibility_boundary` | Public documentation plus safe prototypes; private runtime data excluded |

## Entity: Agent Instruction

Markdown files that guide agent behavior.

| Field | Description |
| --- | --- |
| `path` | Example: `AGENTS.md`, `TOOLS.md`, `SOUL.md`, `USER.md` |
| `purpose` | Operating conventions, tool notes, identity, user context |
| `sensitivity` | Must be reviewed before public commits |

## Entity: Memory Entry

Versioned or local notes that preserve continuity.

| Field | Description |
| --- | --- |
| `path` | Example: `memory/YYYY-MM-DD.md`, `MEMORY.md` |
| `scope` | Daily raw notes or curated long-term context |
| `publication_rule` | Commit only if safe for public sharing |

## Entity: Prototype Project

Application or service prototype stored in the workspace.

| Field | Description |
| --- | --- |
| `path` | Example: `ai-portfolio/`, `aispec-quality/`, `memory-agent/` |
| `runtime` | Next.js, Go, scripts, or other stack |
| `ownership` | Root-tracked unless it has its own `.git` |

## Entity: Nested Repository

Independent project repository present inside the local workspace.

| Field | Description |
| --- | --- |
| `path` | Example: `arrienda/`, `app-entrenamiento-ia/`, `orienta-ai/` |
| `tracked_by_root` | No |
| `reason` | Avoid broken embedded repos and preserve independent history |

## Entity: Automation Script

Shell or program files used for local operations.

| Field | Description |
| --- | --- |
| `path` | Example: `scripts/*.sh`, `set_alarm.sh` |
| `side_effects` | May call local or external services |
| `publication_rule` | Safe only if no real credentials are embedded |

## Entity: Spec

Spec Driven Development artifact.

| Field | Description |
| --- | --- |
| `path` | `specs/<number>-<slug>/` |
| `required_files` | `spec.md`, `plan.md`, `tasks.md`, `quickstart.md` |
| `optional_files` | `data-model.md`, `contracts/`, diagrams, research notes |
