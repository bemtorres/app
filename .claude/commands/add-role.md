# add-role

Adds a new role to the RBAC system (beyond the existing USER and ADMIN roles).

## Usage

```
/add-role <ROLE_NAME>
```

Example: `/add-role MODERATOR`

## Steps

1. **Prisma schema** — Add the new value to the `Role` enum in `apps/api/prisma/schema.prisma`:
   ```prisma
   enum Role {
     USER
     ADMIN
     <ROLE_NAME>
   }
   ```
   Then run: `/migrate add-<role>-role`

2. **Shared types** — Update `libs/types/src/user.types.ts`:
   ```ts
   export enum Role {
     USER = 'USER',
     ADMIN = 'ADMIN',
     <ROLE_NAME> = '<ROLE_NAME>',
   }
   ```

3. **Guards** — In `apps/api/src/auth/guards/roles.guard.ts`, verify the logic still works (it is generic and reads from `@Roles()` decorator — no change needed unless special handling is required).

4. **Frontend** — Update any dropdowns in:
   - `apps/web/src/app/(protected)/admin/users/page.tsx` (the role `<select>`)

5. **Seed** (optional) — If the user wants a seeded user with the new role, add it to `apps/api/prisma/seed.ts`.

Report every file changed.
