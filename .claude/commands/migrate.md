# migrate

Creates and applies a new Prisma migration after the user has edited the schema.

## Usage

```
/migrate <migration-name>
```

Example: `/migrate add-comments-table`

## Steps

1. Read `apps/api/prisma/schema.prisma` and summarise what changed.
2. Run the migration:
   ```
   cd apps/api && npx prisma migrate dev --name <migration-name>
   ```
3. Regenerate the Prisma client:
   ```
   npx prisma generate
   ```
4. If any TypeScript errors appear due to the schema change, fix them:
   - Update `libs/types/src/` interfaces to match the new shape.
   - Update affected service/controller files in `apps/api/src/`.
5. Report the migration filename and any files modified.

## Rules

- Never run `migrate reset` or `migrate deploy` unless explicitly asked.
- If there is a data-loss warning (destructive migration), pause and describe the impact before proceeding.
