/*
  Warnings:

  - You are about to drop the column `status` on the `transaksi` table. All the data in the column will be lost.
  - You are about to alter the column `statusBayar` on the `transaksi` table. The data in that column could be lost. The data in that column will be cast from `TinyInt` to `Enum(EnumId(1))`.

*/
-- AlterTable
ALTER TABLE `transaksi` DROP COLUMN `status`,
    MODIFY `statusBayar` ENUM('NEW', 'PAID', 'DONE') NOT NULL DEFAULT 'NEW';
