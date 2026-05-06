# Fullstack Monorepo

Nx integrated monorepo with Next.js (App Router) frontend and NestJS backend.

## Stack

| Layer | Tech |
|---|---|
| Frontend | Next.js 16, Tailwind CSS, shadcn/ui |
| Backend | NestJS, Prisma ORM |
| Database | PostgreSQL |
| Auth | JWT + bcrypt |
| Monorepo | Nx |

## Structure

```
app/
├── apps/
│   ├── web/          # Next.js (port 3000)
│   └── api/          # NestJS  (port 3001)
├── libs/
│   ├── types/        # Shared TypeScript interfaces
│   ├── ui/           # shadcn/ui components
│   └── config/       # Shared env types & eslint config
├── docker-compose.yml
└── package.json
```

## Quick Start

### 1. Configure environment

```bash
cp .env.example .env.local
# Edit .env.local with your values
```

### 2. Start the database

**Option A — Docker (recommended)**
```bash
docker-compose up -d
```

**Option B — PostgreSQL local (no Docker)**
```bash
# Create the database
createdb -U postgres app

# Update DATABASE_URL in apps/api/.env and .env.local:
# DATABASE_URL="postgresql://<user>:<password>@localhost:5432/app?schema=public"
```

### 3. Install dependencies

```bash
npm install
```

### 4. Set up the API

```bash
# Run migrations
npm run db:migrate

# Seed the admin user
npm run db:seed
```

### 4. Start both apps

```bash
# Terminal 1
npm run dev:api

# Terminal 2
npm run dev:web
```

Open [http://localhost:3000](http://localhost:3000).

## Default Credentials

| Email | Password | Role |
|---|---|---|
| admin@test.com | admin123 | ADMIN |

## API Endpoints

```
POST   /api/auth/register
POST   /api/auth/login
GET    /api/auth/me          (JWT required)

GET    /api/users            (ADMIN)
POST   /api/users            (ADMIN)
PATCH  /api/users/:id        (ADMIN)
DELETE /api/users/:id        (ADMIN)

GET    /api/posts            (public)
GET    /api/posts/:id        (public)
POST   /api/posts            (JWT required)
PATCH  /api/posts/:id        (JWT, own post or ADMIN)
DELETE /api/posts/:id        (JWT, own post or ADMIN)
```

## Frontend Pages

| Path | Access |
|---|---|
| `/login` | Public |
| `/register` | Public |
| `/dashboard` | Authenticated |
| `/posts` | Authenticated |
| `/admin/users` | ADMIN only |

## Nx Commands

```bash
# Lint all projects
npm run lint

# Build
npm run build:web
npm run build:api

# Database
npm run db:generate   # regenerate Prisma client
npm run db:migrate    # run migrations
npm run db:seed       # seed admin user
```
