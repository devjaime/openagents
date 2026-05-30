# Implementation Plan: OpenAgents Workspace Documentation

## Technical Context

OpenAgents is a Markdown-first workspace with a small amount of prototype source code and automation scripts. The root repo tracks shared documentation, memory conventions, project notes, and selected prototypes. Several subdirectories are independent Git repositories and are intentionally ignored by the root repo.

## Repository Boundary

### Tracked at Root

- Workspace-level documentation and operating principles.
- Memory and agent instruction files selected for public sharing.
- Prototype folders that are not independent repositories.
- Scripts that are safe to publish and do not embed real credentials.
- SDD specs under `specs/`.

### Ignored at Root

- `.env`, `.env.*`, `secrets.env`, private keys, and credential files.
- `node_modules/`, `.next/`, `dist/`, `build/`, caches, coverage output.
- Logs, local runtime state, databases, archives, and media captures.
- Nested repositories such as `arrienda/`, `app-entrenamiento-ia/`, `devjaimeblog/`, `humanloop/`, `orienta-ai/`, and `projects/`.

## Spec Layout

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

## SDD Workflow

1. **Specify**: Define user scenarios, requirements, out-of-scope items, and risks.
2. **Plan**: Define repository boundaries, implementation approach, and validation strategy.
3. **Tasks**: Break the work into reviewable, executable tasks.
4. **Implement**: Edit docs, scripts, or source code in small commits.
5. **Validate**: Run Git checks, secret scans, relevant tests, and README/spec review.

## Validation Strategy

- Confirm `git status --short --branch` before and after edits.
- Review staged files for ignored or sensitive categories.
- Search staged content for obvious secret patterns before pushing.
- Confirm `origin/main` points to the pushed commit.

## Rollback Strategy

Documentation-only changes can be reverted with a normal Git revert commit. If sensitive data is accidentally committed, rotate the exposed secret immediately and remove the data from Git history before continuing public work.
