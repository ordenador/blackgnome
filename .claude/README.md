# Claude Code Configuration

This directory contains configuration and rules for Claude to follow when working on this project.

## 📁 Structure

```
.claude/
├── rules.md              # Validation rules that MUST be followed
├── config.json          # Project validation configuration
├── commands/
│   └── validate-pr.md   # Slash command for running validations
└── README.md            # This file
```

## 🚀 Quick Start

### For Claude (when working on code):

1. **Before starting**: Read `.claude/rules.md` to understand validation requirements
2. **While coding**: Make changes following the project structure
3. **After coding**: Run `/validate-pr` to check all validations
4. **Before committing**: Ensure all validations pass

### For developers (using the scripts):

```bash
# Run all validations at once
./scripts/validate-pr.sh

# Or auto-fix and validate in one command
npm run format && npm run lint:fix && ./scripts/validate-pr.sh

# Quick validation check
npm run test
```

## ✅ Validation Rules Overview

All code must pass these 5 validations:

| # | Validation | Command | Auto-Fix | Must Pass |
|---|-----------|---------|----------|-----------|
| 1 | Prettier Formatting | `npm run format:check` | `npm run format` | ✅ Yes |
| 2 | ESLint (JS/TS) | `npm run lint:js` | `npm run lint:fix` | ✅ Yes |
| 3 | Stylelint (CSS) | `npm run lint:css` | `npm run lint:fix` | ✅ Yes |
| 4 | TypeScript Check | `npm run type-check` | Manual | ✅ Yes |
| 5 | Build Test | `npm run build` | Manual | ✅ Yes |

## 🔄 PR Workflow

```
1. Create feature branch
   ↓
2. Make changes
   ↓
3. Run: npm run format && npm run lint:fix
   ↓
4. Run: /validate-pr (or ./scripts/validate-pr.sh)
   ↓
5. Fix any remaining issues
   ↓
6. git add . && git commit -m "..."
   ↓
7. git push -u origin <branch-name>
   ↓
8. Create/Update PR
   ↓
9. Wait for GitHub Actions CI (runs same validations)
   ↓
10. All checks pass ✅
```

## 📝 Configuration Files

- **ESLint**: Lints JavaScript, TypeScript, and Astro files
- **Prettier**: Formats all code files consistently
- **Stylelint**: Validates CSS syntax and Tailwind rules
- **TypeScript**: Strict type checking for TypeScript files
- **Astro**: Build system and component validation

See `config.json` for detailed configuration.

## 🤖 Claude Rules (.claude/rules.md)

The main rules file explains:
- ✅ What must be validated before committing
- ✅ How to fix common issues
- ✅ What each validation checks
- ✅ PR completion checklist

**Important**: Always follow the rules in `.claude/rules.md` when working on this project.

## 🛠️ Slash Commands

### `/validate-pr`
Runs all 5 validations to ensure code is ready for PR.

Usage:
```
/validate-pr
```

## 🎯 Best Practices

1. **Run validations early** - Don't wait until the end
2. **Use auto-fix tools** - `npm run format && npm run lint:fix`
3. **Fix TypeScript errors immediately** - Can't be auto-fixed
4. **Test the build locally** - `npm run build`
5. **Read error messages** - They're usually clear about what needs fixing

## ❓ Troubleshooting

### Validations failing locally but CI passes?
- Run `npm install` to ensure dependencies are up to date
- Clear cache: `rm -rf node_modules/.cache`

### Pre-commit hook preventing commits?
- Run `npm run lint:fix && npm run format` to auto-fix
- Then commit again

### TypeScript errors after changes?
- Check the error messages carefully
- Ensure correct type annotations
- Add null checks where needed

## 📚 Learn More

- [Claude Code Docs](https://docs.claude.com)
- [ESLint Config](../eslint.config.js)
- [Prettier Config](../.prettierrc)
- [Stylelint Config](../.stylelintrc.json)
- [TypeScript Config](../tsconfig.json)
- [Astro Docs](https://docs.astro.build)
