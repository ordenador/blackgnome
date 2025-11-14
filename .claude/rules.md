# Claude Code Validation Rules

These rules ensure all code changes pass the project's pipeline validations before completing a PR.

## 🔄 Pipeline Validation Chain

Before marking any task as complete or pushing changes, **ALWAYS execute all validations** in this order:

### 1. Code Formatting (Prettier)

```bash
npm run format:check
```

- Validates consistent code formatting across JavaScript, TypeScript, CSS, JSON, YAML, Markdown, and Astro files
- If fails: `npm run format` to auto-fix
- **Required**: ✅ Must pass

### 2. JavaScript/TypeScript Linting (ESLint)

```bash
npm run lint:js
```

- Checks for code quality issues, unused variables, console usage
- Supports: `.js`, `.mjs`, `.ts`, `.astro` files
- If fails: `npm run lint:fix` to auto-fix most issues
- **Required**: ✅ Must pass

### 3. CSS Linting (Stylelint)

```bash
npm run lint:css
```

- Validates CSS syntax and Tailwind CSS rules
- Applies: `src/**/*.css`
- If fails: `npm run lint:fix` to auto-fix CSS issues
- **Required**: ✅ Must pass

### 4. TypeScript Type Checking (Astro)

```bash
npm run type-check
```

- Full TypeScript strict mode validation
- Validates `.ts`, `.tsx`, `.astro` files
- No auto-fix available; must be fixed manually
- **Required**: ✅ Must pass

### 5. Project Build (Astro)

```bash
npm run build
```

- Builds entire project with Astro
- Validates all components render correctly
- Generates `/dist` folder
- **Required**: ✅ Must pass

## ✅ Quick Validation

Run all validations at once using the provided script:

```bash
./scripts/validate-pr.sh
```

Or use the Claude Code slash command:

```
/validate-pr
```

## 🚀 PR Completion Checklist

Before creating/updating a PR:

- [ ] All changes implemented
- [ ] Run `npm run format && npm run lint:fix` to auto-fix
- [ ] Run `/validate-pr` or `./scripts/validate-pr.sh` and confirm all pass
- [ ] Run `git add .` and `git commit -m "..."` (pre-commit hooks will run)
- [ ] Run `git push -u origin <branch-name>`
- [ ] All GitHub Actions CI checks pass
- [ ] Create/update PR

## 📋 Validation Rules for Claude

**When working on code:**

1. Make all changes on the feature branch
2. After each logical change, verify locally with `npm run format && npm run lint:fix`
3. Before committing, run `/validate-pr` to ensure all checks pass
4. If any validation fails, fix issues and re-run validations
5. Only commit when all validations pass

**Pre-commit hooks (Husky):**

- Automatically format and lint staged files
- Run TypeScript type check
- Prevent commits with validation errors

**GitHub Actions CI (on push/PR):**

- Runs all validations again
- Fails if any check doesn't pass
- Must pass before merging to main

## 🔧 Configuration Files

- **ESLint**: `eslint.config.js`
- **Prettier**: `.prettierrc`
- **Stylelint**: `.stylelintrc.json`
- **TypeScript**: `tsconfig.json`
- **Astro**: `astro.config.mjs`
- **Husky Hooks**: `.husky/pre-commit`

## 🐛 Common Issues & Solutions

### Prettier formatting issues

```bash
npm run format
```

### ESLint violations

```bash
npm run lint:fix    # Auto-fix most issues
npm run lint:js     # See remaining issues
```

### Stylelint CSS issues

```bash
npm run lint:fix    # Auto-fix CSS issues
```

### TypeScript type errors

- No auto-fix available
- Read error messages carefully
- Fix types manually in source files
- Common fixes: proper type annotations, null checks, imports

### Build failures

- Check build output for specific errors
- Ensure all imports are correct
- Verify no broken components
- Run `npm install` if dependencies changed

## 🎯 Remember

✅ **Always validate before pushing** - It takes 30 seconds to run validations, prevents CI failures, and ensures code quality.

✅ **Fix issues immediately** - Easier to fix while context is fresh.

✅ **Use auto-fix tools** - `npm run format && npm run lint:fix` handles 90% of issues.

✅ **Read error messages** - They clearly indicate what needs fixing.
