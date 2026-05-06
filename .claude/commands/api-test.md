# api-test

Tests the API endpoints interactively using curl. Useful for verifying auth, users, and posts flows.

## Usage

```
/api-test
/api-test <endpoint>
```

## Default: full auth flow

If no endpoint is specified, run this sequence and show each response:

1. **Register** a test user:
   ```
   curl -s -X POST http://localhost:3001/api/auth/register \
     -H "Content-Type: application/json" \
     -d '{"email":"test@example.com","password":"test123"}'
   ```

2. **Login** as admin and capture the token:
   ```
   curl -s -X POST http://localhost:3001/api/auth/login \
     -H "Content-Type: application/json" \
     -d '{"email":"admin@test.com","password":"admin123"}'
   ```
   Extract `access_token` from the response.

3. **Get current user** (`/api/auth/me`) with the token.

4. **List users** (admin-only):
   ```
   curl -s http://localhost:3001/api/users \
     -H "Authorization: Bearer <token>"
   ```

5. **Create a post**:
   ```
   curl -s -X POST http://localhost:3001/api/posts \
     -H "Content-Type: application/json" \
     -H "Authorization: Bearer <token>" \
     -d '{"title":"Hello World","content":"This is my first post."}'
   ```

6. **List all posts** (public):
   ```
   curl -s http://localhost:3001/api/posts
   ```

## Rules

- Pretty-print all JSON responses.
- If any step returns a non-2xx status, highlight the error and stop.
- Do not hardcode tokens in output — mask them as `<token>`.
