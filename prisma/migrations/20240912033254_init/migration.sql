-- CreateTable
CREATE TABLE `admin` (
    `idAdmin` INTEGER NOT NULL AUTO_INCREMENT,
    `uid` VARCHAR(191) NOT NULL DEFAULT '',
    `nama` VARCHAR(191) NOT NULL DEFAULT '',
    `password` VARCHAR(191) NOT NULL DEFAULT '',
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    UNIQUE INDEX `admin_uid_key`(`uid`),
    PRIMARY KEY (`idAdmin`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `penjual` (
    `idPenjual` INTEGER NOT NULL AUTO_INCREMENT,
    `nama` VARCHAR(191) NOT NULL DEFAULT '',
    `email` VARCHAR(191) NOT NULL DEFAULT '',
    `password` VARCHAR(191) NOT NULL DEFAULT '',
    `hp` VARCHAR(191) NOT NULL DEFAULT '',
    `alamat` TEXT NOT NULL DEFAULT '',
    `profile` VARCHAR(191) NOT NULL DEFAULT '',
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    UNIQUE INDEX `penjual_email_key`(`email`),
    PRIMARY KEY (`idPenjual`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `pelanggan` (
    `idPelanggan` INTEGER NOT NULL AUTO_INCREMENT,
    `nama` VARCHAR(191) NOT NULL DEFAULT '',
    `email` VARCHAR(191) NOT NULL DEFAULT '',
    `password` VARCHAR(191) NOT NULL DEFAULT '',
    `hp` VARCHAR(191) NOT NULL DEFAULT '',
    `alamt` TEXT NOT NULL DEFAULT '',
    `profile` VARCHAR(191) NOT NULL DEFAULT '',
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    UNIQUE INDEX `pelanggan_email_key`(`email`),
    PRIMARY KEY (`idPelanggan`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `hewan` (
    `idHewan` INTEGER NOT NULL AUTO_INCREMENT,
    `uid` VARCHAR(191) NOT NULL DEFAULT '',
    `berat` VARCHAR(191) NOT NULL DEFAULT '',
    `umur` INTEGER NOT NULL DEFAULT 0,
    `harga` INTEGER NOT NULL DEFAULT 0,
    `kategori` ENUM('SAPI', 'KAMBING') NOT NULL DEFAULT 'SAPI',
    `deskripsi` TEXT NOT NULL DEFAULT '',
    `foto` VARCHAR(191) NOT NULL DEFAULT '',
    `idPenjual` INTEGER NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    UNIQUE INDEX `hewan_uid_key`(`uid`),
    PRIMARY KEY (`idHewan`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `transaksi` (
    `idTransaksi` INTEGER NOT NULL AUTO_INCREMENT,
    `uid` VARCHAR(191) NOT NULL DEFAULT '',
    `tglTransaksi` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `totalBayar` INTEGER NOT NULL DEFAULT 0,
    `statusBayar` BOOLEAN NOT NULL DEFAULT false,
    `pembayaran` ENUM('TRANSFER', 'COD') NOT NULL DEFAULT 'TRANSFER',
    `idHewan` INTEGER NULL,
    `idPenjual` INTEGER NULL,
    `idPelanggan` INTEGER NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    UNIQUE INDEX `transaksi_uid_key`(`uid`),
    PRIMARY KEY (`idTransaksi`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `detailTransaksi` (
    `idDetail` INTEGER NOT NULL AUTO_INCREMENT,
    `uid` INTEGER NOT NULL DEFAULT 0,
    `jumlah` INTEGER NOT NULL DEFAULT 0,
    `idTransaksi` INTEGER NULL,
    `idHewan` INTEGER NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    UNIQUE INDEX `detailTransaksi_uid_key`(`uid`),
    PRIMARY KEY (`idDetail`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `hewan` ADD CONSTRAINT `hewan_idPenjual_fkey` FOREIGN KEY (`idPenjual`) REFERENCES `penjual`(`idPenjual`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `transaksi` ADD CONSTRAINT `transaksi_idHewan_fkey` FOREIGN KEY (`idHewan`) REFERENCES `hewan`(`idHewan`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `transaksi` ADD CONSTRAINT `transaksi_idPenjual_fkey` FOREIGN KEY (`idPenjual`) REFERENCES `penjual`(`idPenjual`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `transaksi` ADD CONSTRAINT `transaksi_idPelanggan_fkey` FOREIGN KEY (`idPelanggan`) REFERENCES `pelanggan`(`idPelanggan`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `detailTransaksi` ADD CONSTRAINT `detailTransaksi_idTransaksi_fkey` FOREIGN KEY (`idTransaksi`) REFERENCES `transaksi`(`idTransaksi`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `detailTransaksi` ADD CONSTRAINT `detailTransaksi_idHewan_fkey` FOREIGN KEY (`idHewan`) REFERENCES `hewan`(`idHewan`) ON DELETE SET NULL ON UPDATE CASCADE;
