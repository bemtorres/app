# Database Naming Conventions

All database models, fields, and related code MUST use English naming only.

## Rule

- Model names: PascalCase, English (e.g., `Category`, `EmailTemplate`, `User`)
- Field names: camelCase, English (e.g., `firstName`, `createdAt`, `isActive`)
- Enum values: UPPER_SNAKE_CASE, English (e.g., `USER`, `ADMIN`)
- Seed data labels: English (e.g., "Welcome", not "Bienvenida")
- Template names and subjects: English

## Why

Consistent English naming across the codebase ensures:
- Cross-team readability
- Standard tooling compatibility (Prisma, TypeScript, GraphQL)
- Easier international collaboration
- Consistent API contract across frontend/backend

## Enforcement

This rule applies to:
- Prisma schema models and fields
- TypeScript interfaces and types
- Seed scripts and DTOs
- API responses and error messages
- Frontend labels and display text

## Existing Violations (to fix)

If any model has non-English field names (e.g., `nombre`, `descripcion`, `asunto`, `cuerpo`), they must be renamed to English equivalents:
- `nombre` -> `name`
- `descripcion` -> `description`
- `asunto` -> `subject`
- `cuerpo` -> `body`
- `nombre` (templates) -> `name`