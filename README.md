# RentOne API Contracts

OpenAPI 3.0.3 specifications for the RentOne car rental platform APIs.

## Overview

This repository contains the API contracts (OpenAPI specifications) for the RentOne platform, serving as the single source of truth for all API definitions.

## Structure

```
contracts/
├── customer/         # Customer-facing API
│   ├── customer.yaml
│   └── components/
├── company/          # Company management API
│   ├── company.yaml
│   └── components/
└── shared/           # Shared components
    ├── schemas/
    └── parameters/
```

## Contracts

### Customer API
- **File**: `contracts/customer/customer.yaml`
- **Description**: Customer-facing API for vehicle search, reservations, and user management
- **Base URL**: `/api/v1/customer`

### Company API
- **File**: `contracts/company/company.yaml`
- **Description**: Company management API for fleet management and reservation handling
- **Base URL**: `/api/v1/company`

### Shared Components
- **Location**: `contracts/shared/`
- **Contains**: Common schemas (vehicles, reservations, errors) and parameters

## Versioning

This repository uses **Semantic Versioning** (SemVer) via git tags:

- **Major (v2.0.0)**: Breaking changes
- **Minor (v1.1.0)**: New features (backward compatible)
- **Patch (v1.0.1)**: Bug fixes, documentation

**Latest Release**: See [GitHub Releases](https://github.com/Sylentis/rentone-api-contracts/releases)

## Integration

### Option 1: Git Submodule (Recommended for Backend)

```bash
# Add as submodule
git submodule add https://github.com/Sylentis/rentone-api-contracts.git contracts

# Pin to specific version
cd contracts
git checkout v1.0.0

# Update to new version later
cd contracts
git fetch --tags
git checkout v1.1.0
```

### Option 2: NPM Package (For Frontend)

```bash
npm install @sylentis/rentone-api-contracts
```

### Option 3: Direct URL Reference

```bash
# Download specific version
curl -O https://raw.githubusercontent.com/Sylentis/rentone-api-contracts/v1.0.0/contracts/customer/customer.yaml
```

See `examples/` directory for detailed integration guides.

## Validation

All contracts are automatically validated on every PR:
- **OpenAPI Validator**: Ensures YAML syntax and spec compliance
- **Spectral Linter**: Enforces API design best practices
- **Bundle Test**: Verifies all $ref links are valid

To validate locally:

```bash
./scripts/validate.sh
```

## CI/CD

### Validation Workflow
Runs on every PR to validate all contracts.

### Release Workflow
Triggered by git tags (v*.*.*) to create GitHub Releases.

## Contributing

1. Create a feature branch
2. Make changes to contracts
3. Run `./scripts/validate.sh` locally
4. Create a pull request
5. Wait for CI validation
6. Merge after approval

## Development

### Prerequisites
- Node.js 18+ (for validation tools)
- OpenAPI CLI tools

### Install Dependencies

```bash
npm install -g @stoplight/spectral-cli @apidevtools/swagger-cli
```

### Validate Contracts

```bash
# Validate all contracts
./scripts/validate.sh

# Lint with Spectral
spectral lint contracts/customer/customer.yaml
spectral lint contracts/company/company.yaml
```

## Release Process

1. Update `CHANGELOG.md` with changes
2. Commit changes: `git commit -m "chore: prepare v1.1.0 release"`
3. Create git tag: `git tag -a v1.1.0 -m "Release v1.1.0"`
4. Push tag: `git push origin v1.1.0`
5. GitHub Actions automatically creates the release

## Links

- **Main Repository**: https://github.com/Sylentis/rentone-api-contracts
- **Releases**: https://github.com/Sylentis/rentone-api-contracts/releases
- **Issues**: https://github.com/Sylentis/rentone-api-contracts/issues

## License

MIT License - see [LICENSE](LICENSE) file for details.

## Maintainers

- RNT-ALPH Team

## Contact

For questions or issues, please [open an issue](https://github.com/Sylentis/rentone-api-contracts/issues/new).
