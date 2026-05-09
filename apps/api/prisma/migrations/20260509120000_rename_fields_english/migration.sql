-- Rename fields to English
ALTER TABLE "Category" RENAME COLUMN "nombre" TO "name";
ALTER TABLE "Category" RENAME COLUMN "descripcion" TO "description";

ALTER TABLE "EmailTemplate" RENAME COLUMN "nombre" TO "name";
ALTER TABLE "EmailTemplate" RENAME COLUMN "asunto" TO "subject";
ALTER TABLE "EmailTemplate" RENAME COLUMN "cuerpo" TO "body";