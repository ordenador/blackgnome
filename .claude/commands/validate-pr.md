# Validate PR Changes

Executes all pipeline validations before committing changes. This ensures your code passes:

- Prettier formatting checks
- ESLint JavaScript/TypeScript linting
- Stylelint CSS linting
- TypeScript type checking
- Full project build

## What it does:

1. Runs `npm run format:check` - Validates code formatting with Prettier
2. Runs `npm run lint:js` - Checks JavaScript/TypeScript with ESLint
3. Runs `npm run lint:css` - Checks CSS with Stylelint
4. Runs `npm run type-check` - TypeScript validation with Astro
5. Runs `npm run build` - Builds the entire project

If all validations pass, your code is ready for commit and PR.

## Usage:

```
/validate-pr
```

## Quick fixes:

If validation fails, you can auto-fix formatting and linting issues with:

```bash
npm run format && npm run lint:fix
```

Then run `/validate-pr` again to verify all issues are resolved.
