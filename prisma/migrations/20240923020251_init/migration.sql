/*
  Warnings:

  - You are about to drop the column `uid` on the `admin` table. All the data in the column will be lost.
  - You are about to drop the column `uid` on the `detailtransaksi` table. All the data in the column will be lost.
  - You are about to drop the column `uid` on the `hewan` table. All the data in the column will be lost.
  - You are about to drop the column `uid` on the `transaksi` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[uuid]` on the table `admin` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[uuid]` on the table `detailTransaksi` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[uuid]` on the table `hewan` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[uuid]` on the table `pelanggan` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[uuid]` on the table `penjual` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[uuid]` on the table `transaksi` will be added. If there are existing duplicate values, this will fail.

*/
-- DropIndex
DROP INDEX `admin_uid_key` ON `admin`;

-- DropIndex
DROP INDEX `detailTransaksi_uid_key` ON `detailtransaksi`;

-- DropIndex
DROP INDEX `hewan_uid_key` ON `hewan`;

-- DropIndex
DROP INDEX `transaksi_uid_key` ON `transaksi`;

-- AlterTable
ALTER TABLE `admin` DROP COLUMN `uid`,
    ADD COLUMN `uuid` VARCHAR(191) NOT NULL DEFAULT '';

-- AlterTable
ALTER TABLE `detailtransaksi` DROP COLUMN `uid`,
    ADD COLUMN `uuid` INTEGER NOT NULL DEFAULT 0;

-- AlterTable
ALTER TABLE `hewan` DROP COLUMN `uid`,
    ADD COLUMN `uuid` VARCHAR(191) NOT NULL DEFAULT '';

-- AlterTable
ALTER TABLE `pelanggan` ADD COLUMN `uuid` VARCHAR(191) NOT NULL DEFAULT '';

-- AlterTable
ALTER TABLE `penjual` ADD COLUMN `uuid` VARCHAR(191) NOT NULL DEFAULT '';

-- AlterTable
ALTER TABLE `transaksi` DROP COLUMN `uid`,
    ADD COLUMN `uuid` VARCHAR(191) NOT NULL DEFAULT '';

-- CreateIndex
CREATE UNIQUE INDEX `admin_uuid_key` ON `admin`(`uuid`);

-- CreateIndex
CREATE UNIQUE INDEX `detailTransaksi_uuid_key` ON `detailTransaksi`(`uuid`);

-- CreateIndex
CREATE UNIQUE INDEX `hewan_uuid_key` ON `hewan`(`uuid`);

-- CreateIndex
CREATE UNIQUE INDEX `pelanggan_uuid_key` ON `pelanggan`(`uuid`);

-- CreateIndex
CREATE UNIQUE INDEX `penjual_uuid_key` ON `penjual`(`uuid`);

-- CreateIndex
CREATE UNIQUE INDEX `transaksi_uuid_key` ON `transaksi`(`uuid`);
