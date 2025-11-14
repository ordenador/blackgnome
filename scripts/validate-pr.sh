#!/bin/bash

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}========================================${NC}"
echo -e "${BLUE}  Pipeline Validation Check${NC}"
echo -e "${BLUE}========================================${NC}\n"

# Track failures
FAILED=0
TOTAL_CHECKS=5

# 1. Format Check (Prettier)
echo -e "${YELLOW}[1/5]${NC} Checking code formatting with Prettier..."
if npm run format:check > /dev/null 2>&1; then
  echo -e "${GREEN}✓${NC} Prettier format check passed\n"
else
  echo -e "${RED}✗${NC} Prettier format check failed"
  echo -e "${YELLOW}   Tip: Run 'npm run format' to auto-fix formatting${NC}\n"
  FAILED=$((FAILED + 1))
fi

# 2. ESLint Check
echo -e "${YELLOW}[2/5]${NC} Checking JavaScript/TypeScript with ESLint..."
if npm run lint:js > /dev/null 2>&1; then
  echo -e "${GREEN}✓${NC} ESLint passed\n"
else
  echo -e "${RED}✗${NC} ESLint found issues"
  echo -e "${YELLOW}   Tip: Run 'npm run lint:fix' to auto-fix issues${NC}\n"
  FAILED=$((FAILED + 1))
fi

# 3. Stylelint Check
echo -e "${YELLOW}[3/5]${NC} Checking CSS with Stylelint..."
if npm run lint:css > /dev/null 2>&1; then
  echo -e "${GREEN}✓${NC} Stylelint passed\n"
else
  echo -e "${RED}✗${NC} Stylelint found issues"
  echo -e "${YELLOW}   Tip: Run 'npm run lint:fix' to auto-fix CSS issues${NC}\n"
  FAILED=$((FAILED + 1))
fi

# 4. TypeScript Type Check
echo -e "${YELLOW}[4/5]${NC} Checking types with TypeScript (Astro)..."
if npm run type-check > /dev/null 2>&1; then
  echo -e "${GREEN}✓${NC} TypeScript check passed\n"
else
  echo -e "${RED}✗${NC} TypeScript check found type errors"
  echo -e "${YELLOW}   Tip: Review the TypeScript errors above${NC}\n"
  FAILED=$((FAILED + 1))
fi

# 5. Build Check
echo -e "${YELLOW}[5/5]${NC} Building project..."
if npm run build > /dev/null 2>&1; then
  echo -e "${GREEN}✓${NC} Build successful\n"
else
  echo -e "${RED}✗${NC} Build failed"
  echo -e "${YELLOW}   Tip: Check the build output above for errors${NC}\n"
  FAILED=$((FAILED + 1))
fi

# Summary
echo -e "${BLUE}========================================${NC}"
if [ $FAILED -eq 0 ]; then
  echo -e "${GREEN}✓ All validations passed!${NC}"
  echo -e "${GREEN}  Your code is ready for commit and PR${NC}"
  echo -e "${BLUE}========================================${NC}"
  exit 0
else
  echo -e "${RED}✗ $FAILED/$TOTAL_CHECKS checks failed${NC}"
  echo -e "${YELLOW}  Please fix the issues above and run this script again${NC}"
  echo -e "${BLUE}========================================${NC}"
  exit 1
fi
