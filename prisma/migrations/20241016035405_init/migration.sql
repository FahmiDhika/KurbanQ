/*
  Warnings:

  - The values [Admin] on the enum `pelanggan_role` will be removed. If these variants are still used in the database, this will fail.
  - The values [Admin] on the enum `pelanggan_role` will be removed. If these variants are still used in the database, this will fail.
  - You are about to drop the `admin` table. If the table is not empty, all the data it contains will be lost.

*/
-- AlterTable
ALTER TABLE `pelanggan` MODIFY `role` ENUM('Pelanggan', 'Penjual') NOT NULL DEFAULT 'Pelanggan';

-- AlterTable
ALTER TABLE `penjual` MODIFY `role` ENUM('Pelanggan', 'Penjual') NOT NULL DEFAULT 'Penjual';

-- DropTable
DROP TABLE `admin`;
