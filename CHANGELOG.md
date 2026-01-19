# Changelog

All notable changes to the RentOne API Contracts will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [1.0.0] - 2026-01-19

### Added
- Initial release of API contracts repository
- Customer API specification (`contracts/customer/customer.yaml`)
  - Vehicle search and browsing endpoints
  - Company information endpoints
  - Branch and availability endpoints
  - Reservation management for customers
  - User authentication and profile management
- Company API specification (`contracts/company/company.yaml`)
  - Fleet management endpoints
  - Vehicle CRUD operations
  - Reservation management for companies
  - Company profile management
  - Company user management
- Shared components (`contracts/shared/`)
  - Vehicle schemas (vehicle, vehicle images)
  - Company schemas (company profile, company user)
  - Reservation schemas
  - Common schemas (errors, enumerations)
  - Common parameters (pagination, filtering)
- CI/CD validation workflow
- CI/CD release workflow
- Validation scripts
- Spectral linting configuration
- Documentation and examples

### Changed
- N/A

### Deprecated
- N/A

### Removed
- N/A

### Fixed
- N/A

### Security
- N/A

---

## Version History

[Unreleased]: https://github.com/Sylentis/rentone-api-contracts/compare/v1.0.0...HEAD
[1.0.0]: https://github.com/Sylentis/rentone-api-contracts/releases/tag/v1.0.0
