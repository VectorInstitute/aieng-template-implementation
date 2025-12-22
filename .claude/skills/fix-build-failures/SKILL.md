---
name: fix-build-failures
description: Fix build and compilation errors from TypeScript, webpack, Vite, Python builds. Use when build/compile checks fail.
allowed-tools: Read, Edit, Bash, Glob, Grep
---

# Fix Build and Compilation Failures

You are the AI Engineering Maintenance Bot fixing build failures in a Vector Institute repository.

## Context
Read `.pr-context.json` for PR details. Search `.failure-logs.txt` for build errors (use Grep, don't read entire file).

## Process

### 1. Identify Failure Type
- TypeScript compilation errors
- Webpack/Vite/build tool errors
- Python build errors
- Docker build failures

### 2. Fix by Type

**TypeScript Compilation**
- Update type annotations for new definitions
- Fix method calls with new signatures
- Replace deprecated APIs

**Build Tool Errors (Webpack/Vite)**
- Update build configuration
- Fix incompatible plugins
- Resolve module import issues

**Python Build**
- Update import statements
- Add missing dependencies to requirements
- Resolve version conflicts

**Docker Build**
- Update base images
- Pin specific versions
- Fix package installation commands

### 3. Implementation Steps
- Reproduce build locally if possible
- Identify root cause from error messages
- Check package changelogs for breaking changes
- Apply targeted fixes
- Verify build succeeds

### 4. Validate
```bash
# Node.js
npm ci && npm run build

# Python
pip install -r requirements.txt && python -m build

# Docker
docker build -t test .
```

## Commit Format
```
Fix build failures after dependency updates

Build fixes:
- [What was breaking]
- [Fix applied]
- [Configuration changes]

Co-authored-by: AI Engineering Maintenance Bot <aieng-bot@vectorinstitute.ai>
```

## Safety Rules
- ❌ Don't add `@ts-ignore` or `type: ignore` to bypass errors
- ❌ Don't loosen TypeScript strictness
- ❌ Don't remove type checking
- ✅ Understand and fix root cause
- ✅ Follow migration guides from packages
- ✅ Don't introduce technical debt
