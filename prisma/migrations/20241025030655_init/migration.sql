/*
  Warnings:

  - You are about to drop the column `idPelanggan` on the `transaksi` table. All the data in the column will be lost.
  - You are about to drop the column `idPenjual` on the `transaksi` table. All the data in the column will be lost.
  - You are about to drop the `pelanggan` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `penjual` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE `hewan` DROP FOREIGN KEY `hewan_idPenjual_fkey`;

-- DropForeignKey
ALTER TABLE `transaksi` DROP FOREIGN KEY `transaksi_idPelanggan_fkey`;

-- DropForeignKey
ALTER TABLE `transaksi` DROP FOREIGN KEY `transaksi_idPenjual_fkey`;

-- AlterTable
ALTER TABLE `transaksi` DROP COLUMN `idPelanggan`,
    DROP COLUMN `idPenjual`,
    ADD COLUMN `idUser` INTEGER NULL;

-- DropTable
DROP TABLE `pelanggan`;

-- DropTable
DROP TABLE `penjual`;

-- CreateTable
CREATE TABLE `user` (
    `idUser` INTEGER NOT NULL AUTO_INCREMENT,
    `uuid` VARCHAR(191) NOT NULL DEFAULT '',
    `nama` VARCHAR(191) NOT NULL DEFAULT '',
    `email` VARCHAR(191) NOT NULL DEFAULT '',
    `password` VARCHAR(191) NOT NULL DEFAULT '',
    `hp` VARCHAR(191) NOT NULL DEFAULT '',
    `alamat` TEXT NOT NULL DEFAULT '',
    `profile` VARCHAR(191) NOT NULL DEFAULT '',
    `role` ENUM('Pelanggan', 'Penjual') NOT NULL DEFAULT 'Penjual',
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    UNIQUE INDEX `user_uuid_key`(`uuid`),
    UNIQUE INDEX `user_email_key`(`email`),
    PRIMARY KEY (`idUser`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `hewan` ADD CONSTRAINT `hewan_idPenjual_fkey` FOREIGN KEY (`idPenjual`) REFERENCES `user`(`idUser`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `transaksi` ADD CONSTRAINT `transaksi_idUser_fkey` FOREIGN KEY (`idUser`) REFERENCES `user`(`idUser`) ON DELETE SET NULL ON UPDATE CASCADE;
