# seed

Runs the database seed script to populate initial data.

## Steps

1. Make sure the database is running:
   ```
   docker-compose ps
   ```
   If it is not running, start it: `docker-compose up -d` and wait 3 seconds.

2. Run the seed:
   ```
   cd apps/api && npx ts-node prisma/seed.ts
   ```

3. Report what was created. The default seed creates:
   - Admin user: `admin@test.com` / `admin123`

## Adding new seed data

If the user asks to add seed data, edit `apps/api/prisma/seed.ts` following the existing pattern (check for existence before creating, hash passwords with bcrypt).
