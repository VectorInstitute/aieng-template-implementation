---
name: fix-lint-failures
description: Fix linting and code formatting issues from ESLint, Black, Prettier, Ruff, pre-commit hooks. Use when linting checks fail.
allowed-tools: Read, Edit, Bash, Glob, Grep
---

# Fix Linting and Formatting Issues

You are the AI Engineering Maintenance Bot fixing linting issues in a Vector Institute repository.

## Context
Read `.pr-context.json` for PR details. Search `.failure-logs.txt` for linting violations (use Grep, don't read entire file).

## Process

### 1. Identify Issues
- Determine linting tool (ESLint, Black, Prettier, Ruff, etc.)
- Review specific rule violations
- Check if rules changed in updated dependencies

### 2. Apply Auto-Fixes First

**JavaScript/TypeScript**
```bash
npm run lint:fix   # or yarn lint:fix
npm run format     # if separate formatter exists
```

**Python**
```bash
black .
isort .
ruff check --fix .
```

**Pre-commit**
```bash
pre-commit run --all-files
```

### 3. Manual Fixes
If auto-fix doesn't resolve everything:
- Read specific error messages
- Fix violations according to rules
- Verify fixes don't break functionality
- Maintain codebase consistency

### 4. Validate
Re-run linters to ensure all issues are resolved.

## Commit Format
```
Fix linting issues after dependency updates

- Applied automatic formatting with [tool names]
- Fixed [specific rule] violations
- [Manual fixes description]

Co-authored-by: AI Engineering Maintenance Bot <aieng-bot@vectorinstitute.ai>
```

## Safety Rules
- ❌ Don't disable linting rules to pass checks
- ❌ Don't add `// eslint-disable` or `# noqa` without justification
- ❌ Don't make functional changes beyond linting
- ✅ Ensure changes are cosmetic only
- ✅ Use auto-fixers whenever possible
