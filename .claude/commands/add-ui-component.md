# add-ui-component

Adds a new shadcn/ui component to `libs/ui/src/components/` and exports it.

## Usage

```
/add-ui-component <component-name>
```

Example: `/add-ui-component select`

## Steps

1. Look up the shadcn/ui source for `<component-name>` at https://ui.shadcn.com/docs/components/<component-name>.
2. Create `libs/ui/src/components/<component-name>.tsx` following the shadcn/ui pattern:
   - Use `@radix-ui` primitives where applicable.
   - Import `cn` from `../lib/utils`.
   - Export all named parts.
3. Add the export to `libs/ui/src/index.ts`:
   ```ts
   export * from './components/<component-name>';
   ```
4. If the Radix primitive is not yet installed, add it to the root `package.json` dependencies and run `npm install`.

## Rules

- Only implement the component — do not modify any app code.
- Follow the exact same style as existing components in `libs/ui/src/components/`.
- Do not add extra Radix packages beyond what the component needs.
