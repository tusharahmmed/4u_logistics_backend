/*
  Warnings:

  - The values [confirmed] on the enum `STATUS` will be removed. If these variants are still used in the database, this will fail.

*/
-- AlterEnum
BEGIN;
CREATE TYPE "STATUS_new" AS ENUM ('pending', 'canceled', 'completed');
ALTER TABLE "driver_requestes" ALTER COLUMN "status" DROP DEFAULT;
ALTER TABLE "quote_requestes" ALTER COLUMN "status" DROP DEFAULT;
ALTER TABLE "custormer_requestes" ALTER COLUMN "status" DROP DEFAULT;
ALTER TABLE "quote_requestes" ALTER COLUMN "status" TYPE "STATUS_new" USING ("status"::text::"STATUS_new");
ALTER TABLE "driver_requestes" ALTER COLUMN "status" TYPE "STATUS_new" USING ("status"::text::"STATUS_new");
ALTER TABLE "custormer_requestes" ALTER COLUMN "status" TYPE "STATUS_new" USING ("status"::text::"STATUS_new");
ALTER TYPE "STATUS" RENAME TO "STATUS_old";
ALTER TYPE "STATUS_new" RENAME TO "STATUS";
DROP TYPE "STATUS_old";
ALTER TABLE "driver_requestes" ALTER COLUMN "status" SET DEFAULT 'pending';
ALTER TABLE "quote_requestes" ALTER COLUMN "status" SET DEFAULT 'pending';
ALTER TABLE "custormer_requestes" ALTER COLUMN "status" SET DEFAULT 'pending';
COMMIT;
