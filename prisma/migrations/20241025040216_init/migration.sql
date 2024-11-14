/*
  Warnings:

  - You are about to drop the column `jumlah` on the `detailtransaksi` table. All the data in the column will be lost.
  - You are about to drop the column `idHewan` on the `transaksi` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE `transaksi` DROP FOREIGN KEY `transaksi_idHewan_fkey`;

-- AlterTable
ALTER TABLE `detailtransaksi` DROP COLUMN `jumlah`;

-- AlterTable
ALTER TABLE `transaksi` DROP COLUMN `idHewan`;
