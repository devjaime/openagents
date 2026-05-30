# Contract: Root Repository Safety and Documentation

## Public Repository Contract

The root OpenAgents repository is safe to publish when all of the following are true:

- No real credentials are committed.
- No local environment files are committed.
- No runtime logs, databases, media captures, archives, or generated dependency folders are committed.
- Nested Git repositories are not added as embedded repositories.
- Specs and README files describe the current repository boundary accurately.

## Required Documentation Contract

The root repository must provide:

- `README.md`: bilingual English and Spanish project overview.
- `specs/constitution.md`: durable principles.
- `specs/<number>-<slug>/spec.md`: user scenarios and requirements.
- `specs/<number>-<slug>/plan.md`: implementation plan.
- `specs/<number>-<slug>/tasks.md`: actionable checklist.
- `specs/<number>-<slug>/quickstart.md`: validation and usage guide.

## Commit Validation Contract

Before pushing documentation or workspace changes:

```bash
git status --short --branch
git diff --cached --name-only
git diff --cached --stat
```

The staged file list must be reviewed for:

- `.env`, `.env.*`, `secrets.env`
- private keys or certificates
- `node_modules/`, `.next/`, `dist/`, `build/`, caches
- logs, databases, archives, media captures
- nested repository paths

## External Service Contract

Scripts that call external services must document:

- Required environment variables.
- Expected side effects.
- Safe dry-run or inspection command when available.
- Failure behavior and recovery steps.
