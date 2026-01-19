#!/bin/bash

set -e

echo "╔═══════════════════════════════════════════════════════════════╗"
echo "║         RentOne API Contracts - Validation                    ║"
echo "╚═══════════════════════════════════════════════════════════════╝"
echo ""

# Check for required tools
command -v swagger-cli >/dev/null 2>&1 || {
  echo "❌ Error: swagger-cli not found"
  echo "Install with: npm install -g @apidevtools/swagger-cli"
  exit 1
}

command -v spectral >/dev/null 2>&1 || {
  echo "❌ Error: spectral not found"
  echo "Install with: npm install -g @stoplight/spectral-cli"
  exit 1
}

echo "┌─────────────────────────────────────────────────────────────────┐"
echo "│ Step 1/4: Validating Customer API                              │"
echo "└─────────────────────────────────────────────────────────────────┘"
swagger-cli validate contracts/customer/customer.yaml
echo "✅ Customer API is valid"
echo ""

echo "┌─────────────────────────────────────────────────────────────────┐"
echo "│ Step 2/4: Validating Company API                               │"
echo "└─────────────────────────────────────────────────────────────────┘"
swagger-cli validate contracts/company/company.yaml
echo "✅ Company API is valid"
echo ""

echo "┌─────────────────────────────────────────────────────────────────┐"
echo "│ Step 3/4: Linting with Spectral                                │"
echo "└─────────────────────────────────────────────────────────────────┘"
spectral lint contracts/customer/customer.yaml --ruleset .spectral.yaml
spectral lint contracts/company/company.yaml --ruleset .spectral.yaml
echo "✅ Linting passed"
echo ""

echo "┌─────────────────────────────────────────────────────────────────┐"
echo "│ Step 4/4: Testing contract bundling                            │"
echo "└─────────────────────────────────────────────────────────────────┘"
mkdir -p /tmp/rentone-contracts
swagger-cli bundle contracts/customer/customer.yaml -o /tmp/rentone-contracts/customer-bundled.yaml
swagger-cli bundle contracts/company/company.yaml -o /tmp/rentone-contracts/company-bundled.yaml
echo "✅ Bundling successful - all \$ref links are valid"
echo ""

echo "╔═══════════════════════════════════════════════════════════════╗"
echo "║           ✅ All validation checks passed!                    ║"
echo "╚═══════════════════════════════════════════════════════════════╝"
