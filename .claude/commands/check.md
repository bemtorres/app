# check

Validates the full project: TypeScript types, ESLint, Prisma schema, and project structure.

## Steps

Run each check and report pass/fail:

1. **TypeScript — API**
   ```
   cd apps/api && npx tsc --noEmit
   ```

2. **TypeScript — Web**
   ```
   cd apps/web && npx tsc --noEmit
   ```

3. **TypeScript — Libs**
   ```
   cd libs/types && npx tsc --noEmit
   cd libs/ui && npx tsc --noEmit
   ```

4. **Prisma schema validation**
   ```
   cd apps/api && npx prisma validate
   ```

5. **Check required files exist** — Verify these files are present:
   - `apps/api/prisma/schema.prisma`
   - `apps/api/src/main.ts`
   - `apps/web/src/app/layout.tsx`
   - `docker-compose.yml`
   - `.env` in `apps/api`

## After checks

- If everything passes: report "All checks passed."
- If anything fails: show the exact errors and fix them immediately.
- Do not mark the check as complete until all errors are resolved.
