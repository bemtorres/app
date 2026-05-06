# db-setup

Configura la base de datos del proyecto: migraciones Prisma y seed del usuario admin.

Soporta dos modos: **Docker** (por defecto) o **PostgreSQL instalado localmente**.

---

## Modo A — Docker

1. Asegurarse que Docker Desktop está corriendo y levantar el contenedor:
   ```
   docker-compose up -d
   ```
2. Verificar que el contenedor está activo:
   ```
   docker-compose ps
   ```
3. Continuar con los pasos comunes (abajo).

---

## Modo B — PostgreSQL local (sin Docker)

Usar este modo cuando PostgreSQL está instalado directamente en la máquina.

1. Verificar que el servicio de PostgreSQL está corriendo:
   - **Windows**: `Get-Service postgresql*` en PowerShell, o abrir Services y buscar `postgresql`.
   - **Mac/Linux**: `brew services list | grep postgresql` o `pg_isready`.

2. Crear la base de datos si no existe. En `psql` como superusuario:
   ```sql
   CREATE DATABASE app;
   ```
   O con `createdb`:
   ```
   createdb -U postgres app
   ```

3. Actualizar `apps/api/.env` con las credenciales locales:
   ```
   DATABASE_URL="postgresql://<tu-usuario>:<tu-password>@localhost:5432/app?schema=public"
   ```
   También actualizar `.env.local` en la raíz si se usa como referencia.

4. Continuar con los pasos comunes (abajo).

---

## Pasos comunes (ambos modos)

Ejecutar desde la raíz del workspace:

```bash
# 1. Generar el cliente Prisma
cd apps/api && npx prisma generate

# 2. Correr las migraciones
npx prisma migrate dev --name init

# 3. Ejecutar el seed
npx ts-node prisma/seed.ts
```

Al finalizar, confirmar que el usuario admin fue creado:
- Email: `admin@test.com`
- Password: `admin123`

---

## Errores comunes

| Error | Causa | Solución |
|---|---|---|
| `ECONNREFUSED 5432` | PostgreSQL no está corriendo | Iniciar Docker o el servicio local |
| `password authentication failed` | Credenciales incorrectas en `DATABASE_URL` | Corregir usuario/contraseña en `.env` |
| `database "app" does not exist` | La base de datos no fue creada | `createdb -U postgres app` |
| `P1001: Can't reach database server` | Host o puerto incorrecto | Verificar `DATABASE_URL` |
