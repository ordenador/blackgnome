# Claude Code Validation Rules - Quick Start

## 🎯 What You Need to Know

Before committing code changes for a PR, **you MUST validate** that:

1. ✅ Code formatting is correct (Prettier)
2. ✅ JavaScript/TypeScript passes linting (ESLint)
3. ✅ CSS passes linting (Stylelint)
4. ✅ TypeScript types are correct
5. ✅ The project builds successfully

## ⚡ Quick Commands

### Auto-fix most issues:

```bash
npm run format && npm run lint:fix
```

### Validate all checks:

```bash
./scripts/validate-pr.sh
```

Or use the Claude slash command:

```
/validate-pr
```

## 📋 Before Each Commit

```
1. Make changes to files
2. Run: npm run format && npm run lint:fix
3. Run: ./scripts/validate-pr.sh (or /validate-pr)
4. If all pass ✅ → Continue to commit
5. If any fail ❌ → Fix and repeat steps 2-3
```

## 🔧 What to Do If Validation Fails

### Prettier formatting fails:

```bash
npm run format
```

### ESLint fails:

```bash
npm run lint:js        # See what's wrong
npm run lint:fix       # Auto-fix
```

### Stylelint (CSS) fails:

```bash
npm run lint:css       # See what's wrong
npm run lint:fix       # Auto-fix CSS
```

### TypeScript type errors:

- No auto-fix available
- Read the error messages
- Fix the code manually
- Common issues: missing types, null checks, imports

### Build fails:

- Check the error message
- Ensure all imports are correct
- Verify components are valid
- Run: `npm run build` to see full error

## 📚 Full Documentation

See `.claude/rules.md` for complete details about:

- What each validation checks
- How to fix issues
- Configuration files
- PR completion checklist

## ✅ You're Ready!

Now when you work on code:

1. **Make changes** on your feature branch
2. **Auto-fix issues**: `npm run format && npm run lint:fix`
3. **Validate everything**: `./scripts/validate-pr.sh`
4. **Commit & push** when all validations pass
5. **Create PR** on GitHub

The GitHub Actions CI will run the same checks - they should all pass! 🎉
