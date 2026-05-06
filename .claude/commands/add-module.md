# add-module

Scaffolds a complete feature module for the monorepo: a NestJS backend module + a Next.js frontend page.

## Usage

```
/add-module <module-name>
```

Example: `/add-module products`

## What to create

### Backend — `apps/api/src/<module>/`

1. **`<module>.module.ts`** — NestJS module importing PrismaModule
2. **`<module>.service.ts`** — CRUD service using PrismaService with `findAll`, `findOne`, `create`, `update`, `remove`
3. **`<module>.controller.ts`** — REST controller with GET/POST/PATCH/DELETE routes, JwtAuthGuard applied where needed
4. **`dto/create-<module>.dto.ts`** — DTO with class-validator decorators
5. **`dto/update-<module>.dto.ts`** — Partial DTO for updates

Then register the module in `apps/api/src/app.module.ts`.

### Prisma schema — `apps/api/prisma/schema.prisma`

Add a new model for the resource with at least: `id`, `createdAt`, and a relation to `User` (authorId) if appropriate.
Remind the user to run:
```
cd apps/api && npx prisma migrate dev --name add-<module>
```

### Frontend — `apps/web/src/app/(protected)/<module>/page.tsx`

A full page with:
- A data table (use `@app/ui` Table components) listing all records
- A Dialog with a form (react-hook-form + zod) to create/edit
- Delete confirmation using `confirm()`
- API calls through `apps/web/src/lib/api.ts`
- Types imported from `@app/types`

### Types — `libs/types/src/<module>.types.ts`

Add the shared interface and DTOs, then re-export from `libs/types/src/index.ts`.

## Rules

- Follow existing patterns in `auth`, `users`, and `posts` modules exactly.
- Use `@app/ui` components — never install new UI libraries.
- Apply `JwtAuthGuard` to write routes; keep read routes public unless the user says otherwise.
- Do not add features beyond what is asked.
