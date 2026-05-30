# Quickstart: OpenAgents Workspace

## 1. Clone

```bash
git clone https://github.com/devjaime/openagents.git
cd openagents
```

## 2. Read the Entry Points

```bash
sed -n '1,220p' README.md
sed -n '1,220p' specs/constitution.md
sed -n '1,220p' AGENTS.md
```

## 3. Inspect Specs

```bash
find specs -maxdepth 3 -type f | sort
```

## 4. Add a New SDD Spec

Create a new numbered folder:

```text
specs/002-your-feature/
  spec.md
  plan.md
  tasks.md
  quickstart.md
```

Use this lifecycle:

```text
specify -> plan -> tasks -> implement -> validate
```

## 5. Validate Before Commit

```bash
git status --short --branch
git diff --cached --name-only
```

Before pushing, verify that staged files do not include secrets, environment files, logs, databases, caches, media captures, or nested repositories.
